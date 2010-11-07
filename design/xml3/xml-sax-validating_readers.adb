with Ada.Unchecked_Deallocation;

with Matreshka.Internals.Strings.Operations;
with Matreshka.Internals.Unicode.Characters.General_Punctuation;
with Matreshka.Internals.Unicode.Characters.Latin;
with XML.SAX.Readers;

package body XML.SAX.Validating_Readers is

   use type Matreshka.Internals.Unicode.Code_Point;
   use type Sources.Read_Status;
   use Matreshka.Internals.Unicode.Characters.General_Punctuation;
   use Matreshka.Internals.Unicode.Characters.Latin;

   procedure Next (Self : in out SAX_Validating_Reader'Class);
   --  Reads next character from input source. When Status is Successful it
   --  means that character is read from source. End_Of_Data means that there
   --  is no character available to read now, but can be available later.
   --  End_Of_Input signals that the end of document is reached.

   function Is_End_Of_Document
    (Self : SAX_Validating_Reader'Class) return Boolean;
   --  Returns True when current status of input source is End_Of_Input, or,
   --  in incremental mode, is End_Of_Data.

   procedure Unexpected_End_Of_Document
    (Self       : in out SAX_Validating_Reader'Class;
     Subprogram : Parse_Subprogram);
   --  Reports unexpected end of document. In incremental mode when end of data
   --  is reached it saves current state to restore parsing from it.

   procedure Report_Parse_Error (Self : in out SAX_Validating_Reader'Class);
   --  Reports parse error;

   package Parser is

      procedure Parse_Document (Self : in out SAX_Validating_Reader'Class);
      --  Parses [1] 'document' production.

      procedure Parse_Prolog (Self : in out SAX_Validating_Reader'Class);
      --  Parses XMLDecl and Misc* subexpressions in [22] 'prolog' production.

   end Parser;

   ---------------------
   -- Content_Handler --
   ---------------------

   overriding function Content_Handler
    (Self : not null access constant SAX_Validating_Reader)
       return XML.SAX.Readers.SAX_Content_Handler_Access is
   begin
      return Self.Content_Handler;
   end Content_Handler;

   -------------------------
   -- Declaration_Handler --
   -------------------------

   overriding function Declaration_Handler
    (Self : not null access constant SAX_Validating_Reader)
       return XML.SAX.Readers.SAX_Declaration_Handler_Access is
   begin
      return Self.Declaration_Handler;
   end Declaration_Handler;

   -----------------
   -- DTD_Handler --
   -----------------

   overriding function DTD_Handler
    (Self : not null access constant SAX_Validating_Reader)
       return XML.SAX.Readers.SAX_DTD_Handler_Access is
   begin
      return Self.DTD_Handler;
   end DTD_Handler;

   ---------------------
   -- Entity_Resolver --
   ---------------------

   overriding function Entity_Resolver
    (Self : not null access constant SAX_Validating_Reader)
       return XML.SAX.Readers.SAX_Entity_Resolver_Access is
   begin
      return Self.Entity_Resolver;
   end Entity_Resolver;

   -------------------
   -- Error_Handler --
   -------------------

   overriding function Error_Handler
    (Self : not null access constant SAX_Validating_Reader)
       return XML.SAX.Readers.SAX_Error_Handler_Access is
   begin
      return Self.Error_Handler;
   end Error_Handler;

   ------------------------
   -- Is_End_Of_Document --
   ------------------------

   function Is_End_Of_Document
    (Self : SAX_Validating_Reader'Class) return Boolean is
   begin
      return Self.Source_Status /= Sources.Successful;
   end Is_End_Of_Document;

   ---------------------
   -- Lexical_Handler --
   ---------------------

   overriding function Lexical_Handler
    (Self : not null access constant SAX_Validating_Reader)
       return XML.SAX.Readers.SAX_Lexical_Handler_Access is
   begin
      return Self.Lexical_Handler;
   end Lexical_Handler;

   ----------
   -- Next --
   ----------

   procedure Next (Self : in out SAX_Validating_Reader'Class) is
      use type Sources.Source_Access;
      use type Matreshka.Internals.Utf16.Utf16_String_Index;

      procedure Free is
        new Ada.Unchecked_Deallocation
             (Sources.Source'Class, Sources.Source_Access);

   begin
      if Self.Current_Entity_Reference.Source /= null then
         loop
            Self.Current_Entity_Reference.Source.Next
             (Self.Code, Self.Source_Status);

            exit when Self.Source_Status /= Sources.Successful;

            if Self.Code = Carriage_Return then
               Self.Current_Entity_Reference.Skip_LF := True;
               Self.Current_Entity_Reference.Line :=
                 Self.Current_Entity_Reference.Line + 1;
               Self.Current_Entity_Reference.Column := 1;
               Self.Code := Line_Feed;

               return;

            elsif Self.Code = Line_Feed or Self.Code = Next_Line then
               if not Self.Current_Entity_Reference.Skip_LF then
                  Self.Current_Entity_Reference.Line :=
                    Self.Current_Entity_Reference.Line + 1;
                  Self.Current_Entity_Reference.Column := 1;
                  Self.Code := Line_Feed;

                  return;
               end if;

               Self.Current_Entity_Reference.Skip_LF := False;

            elsif Self.Code = Line_Separator then
               Self.Current_Entity_Reference.Skip_LF := False;
               Self.Current_Entity_Reference.Line :=
                 Self.Current_Entity_Reference.Line + 1;
               Self.Current_Entity_Reference.Column := 1;
               Self.Code := Line_Feed;

               return;

            else
               Self.Current_Entity_Reference.Column :=
                 Self.Current_Entity_Reference.Column + 1;
               Self.Current_Entity_Reference.Skip_LF := False;

               return;
            end if;
         end loop;

         case Self.Source_Status is
            when Sources.Successful =>
               if not Self.Current_Entity_Reference.Is_Document then
--                  Matreshka.Internals.Utf16.Unchecked_Store
--                   (Self.Current_Entity_Reference.Text.Value,
--                    Self.Current_Entity_Reference.Text.Unused,
--                    Code);
--                  Self.Current_Entity_Reference.Text.Length :=
--                    Self.Current_Entity_Reference.Text.Length + 1;
                  Matreshka.Internals.Strings.Operations.Unterminated_Append
                   (Self.Current_Entity_Reference.Text, Self.Code);
                  --  It is slow operation, would be nice to use the fact that
                  --  filled shared string is not used anywhere, so several
                  --  checks can be avoided. Look to Detached_* API of string
                  --  (if it is implemented).
               end if;

            when Sources.Mailformed =>
               null;

            when Sources.End_Of_Data =>
               null;

            when Sources.End_Of_Input =>
               --  End of current entity, update entities table and pop entity
               --  reference stack.

               if not Self.Current_Entity_Reference.Is_Document then
                  --  Save entity's replacement text and position/index of
                  --  first character after text declaration for future use.

                  --  XXX Not implemented.

                  null;

                  --  Deallocate input source.

                  Free (Self.Current_Entity_Reference.Source);

                  --  Pop entity reference stack.

                  Self.Current_Entity_Reference :=
                    Self.Entity_Reference_Stack.Last_Element;
                  Self.Entity_Reference_Stack.Delete_Last;

                  Self.Next;
               end if;
         end case;

      else
         if Self.Current_Entity_Reference.Position
              < Self.Current_Entity_Reference.Text.Unused
         then
            Matreshka.Internals.Utf16.Unchecked_Next
             (Self.Current_Entity_Reference.Text.Value,
              Self.Current_Entity_Reference.Position,
              Self.Code);
            Self.Source_Status := Sources.Successful;

            --  Update location

            if Self.Code = Line_Feed then
               Self.Current_Entity_Reference.Line :=
                 Self.Current_Entity_Reference.Line + 1;
               Self.Current_Entity_Reference.Column := 1;

            else
               Self.Current_Entity_Reference.Column :=
                 Self.Current_Entity_Reference.Column + 1;
            end if;

         else
            --  Pop entity reference stack.

            Self.Current_Entity_Reference :=
              Self.Entity_Reference_Stack.Last_Element;
            Self.Entity_Reference_Stack.Delete_Last;

            Self.Next;
         end if;
      end if;
   end Next;

   -----------
   -- Parse --
   -----------

   procedure Parse
    (Self   : in out SAX_Validating_Reader'Class;
     Source : not null Sources.Source_Access) is
   begin
      Self.Current_Entity_Reference :=
       (Entity      => 0,
        Is_Document => True,
        Source      => Source,
        Text        => null,
        Position    => 0,
        Line        => 1,
        Column      => 0,
        Skip_LF     => False);
      Self.Parser_Status := Continue;

      Self.Next;
      Parser.Parse_Document (Self);
   end Parse;

   -----------------------
   -- Parse_Incremental --
   -----------------------

   procedure Parse_Incremental
    (Self   : in out SAX_Validating_Reader'Class;
     Source : not null Sources.Source_Access) is
   begin
      null;
   end Parse_Incremental;

   ----------------
   -- Parse_Next --
   ----------------

   procedure Parse_Next (Self : in out SAX_Validating_Reader'Class) is
   begin
      null;
   end Parse_Next;

   ------------
   -- Parser --
   ------------

   package body Parser is

      --  All parsing subprograms has the same structure, it allows to do
      --  incremental parsing.
      --
      --  procedure Parse_... (Self : in out SAX_Validating_Reader'Class) is
      --
      --     type States is (State_Init, ...);
      --     --  States
      --
      --     type Inputs is (Input_..., ...);
      --     --  Inputs
      --
      --     Transition : constant array (States, Inputs) of States
      --       := ...;
      --     --  State transition table.
      --
      --     State : States;
      --     Input : Inputs;
      --
      --  begin
      --     if Self.Parse_State_Stack.Is_Empty then
      --        --  Initialize
      --        ...
      --     else
      --        --  Restore state, call parse function recursively
      --        ...
      --     end if;
      --
      --     loop
      --        case State is
      --           --  Do actions
      --        end case;
      --
      --        if Self.Is_End_Of_Document then
      --           Self.Unexpected_End_Of_Document (Parse_...'Access, State);
      --           return;
      --        end if;
      --
      --        State := Transition (State, Input);
      --
      --        case State is
      --           --  Do actions. Last statement in each handler must be
      --           --  exit/return statement or call of Self.Next procedure.
      --        end case;
      --     end loop;
      --  end Parse_...;

      --------------------
      -- Parse_Document --
      --------------------

      procedure Parse_Document (Self : in out SAX_Validating_Reader'Class) is
      begin
         if Self.Parse_State_Stack.Is_Empty then
            null;

         else
            raise Program_Error;
         end if;

         Parse_Prolog (Self);
--         loop
--            if Self.Is_End_Of_Document then
--               Self.Unexpected_End_Of_Document (Parse_Document'Access);
--
--               return;
--            end if;
--
--            Self.Next;
--         end loop;
      end Parse_Document;

      ------------------
      -- Parse_Prolog --
      ------------------

      procedure Parse_Prolog (Self : in out SAX_Validating_Reader'Class) is

         type States is
          (State_Initial,
           State_Less_Than_Sign,
           State_Processing_Instruction,
           State_Done,
           State_Invalid);

         type Inputs is
          (Input_Less_Than_Sign,
           Input_Question_Mark,
           Input_Unknown);

         Transition : constant array (States, Inputs) of States
           := (State_Initial =>
                (Input_Less_Than_Sign => State_Less_Than_Sign,
                 Input_Question_Mark  => State_Invalid,
                 Input_Unknown        => State_Invalid),
               State_Less_Than_Sign =>
                (Input_Less_Than_Sign => State_Invalid,
                 Input_Question_Mark  => State_Processing_Instruction,
                 Input_Unknown        => State_Invalid),
               State_Processing_Instruction => (others => State_Invalid),
               State_Done => (others => State_Invalid),
               State_Invalid => (others => State_Invalid));

         State : States;
         Input : Inputs;

      begin
         if Self.Parse_State_Stack.Is_Empty then
            State := State_Initial;

         else
            raise Program_Error;
         end if;

         loop
            --  Checks end of document

            if Self.Is_End_Of_Document then
               Self.Unexpected_End_Of_Document (Parse_Document'Access);

               return;
            end if;

            --  Classify current character

            if Self.Code = Less_Than_Sign then
               Input := Input_Less_Than_Sign;

            elsif Self.Code = Question_Mark then
               Input := Input_Question_Mark;

            else
               Input := Input_Unknown;
            end if;

            State := Transition (State, Input);

            case State is
               when State_Initial =>
                  raise Program_Error;

               when State_Less_Than_Sign =>
                  Self.Next;

               when State_Processing_Instruction =>
                  raise Program_Error;

               when State_Done =>
                  return;

               when State_Invalid =>
                  Self.Report_Parse_Error;

                  return;
            end case;
         end loop;
      end Parse_Prolog;

   end Parser;

   ------------------------
   -- Report_Parse_Error --
   ------------------------

   procedure Report_Parse_Error (Self : in out SAX_Validating_Reader'Class) is
   begin
      Self.Parser_Status := Error;
   end Report_Parse_Error;

   -------------------------
   -- Set_Content_Handler --
   -------------------------

   overriding procedure Set_Content_Handler
    (Self    : not null access SAX_Validating_Reader;
     Handler : XML.SAX.Readers.SAX_Content_Handler_Access) is
   begin
     Self.Content_Handler := Handler;
   end Set_Content_Handler;

   -----------------------------
   -- Set_Declaration_Handler --
   -----------------------------

   overriding procedure Set_Declaration_Handler
    (Self    : not null access SAX_Validating_Reader;
     Handler : XML.SAX.Readers.SAX_Declaration_Handler_Access) is
   begin
      Self.Declaration_Handler := Handler;
   end Set_Declaration_Handler;

   ---------------------
   -- Set_DTD_Handler --
   ---------------------

   overriding procedure Set_DTD_Handler
    (Self    : not null access SAX_Validating_Reader;
     Handler : XML.SAX.Readers.SAX_DTD_Handler_Access) is
   begin
      Self.DTD_Handler := Handler;
   end Set_DTD_Handler;

   -------------------------
   -- Set_Entity_Resolver --
   -------------------------

   overriding procedure Set_Entity_Resolver
    (Self     : not null access SAX_Validating_Reader;
     Resolver : XML.SAX.Readers.SAX_Entity_Resolver_Access) is
   begin
      Self.Entity_Resolver := Resolver;
   end Set_Entity_Resolver;

   -----------------------
   -- Set_Error_Handler --
   -----------------------

   overriding procedure Set_Error_Handler
    (Self    : not null access SAX_Validating_Reader;
     Handler : XML.SAX.Readers.SAX_Error_Handler_Access) is
   begin
      Self.Error_Handler := Handler;
   end Set_Error_Handler;

   -------------------------
   -- Set_Lexical_Handler --
   -------------------------

   overriding procedure Set_Lexical_Handler
    (Self    : not null access SAX_Validating_Reader;
     Handler : XML.SAX.Readers.SAX_Lexical_Handler_Access) is
   begin
      Self.Lexical_Handler := Handler;
   end Set_Lexical_Handler;

   --------------------------------
   -- Unexpected_End_Of_Document --
   --------------------------------

   procedure Unexpected_End_Of_Document
    (Self       : in out SAX_Validating_Reader'Class;
     Subprogram : Parse_Subprogram) is
   begin
      Self.Parser_Status := Error;
   end Unexpected_End_Of_Document;

end XML.SAX.Validating_Readers;
