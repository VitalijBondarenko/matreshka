------------------------------------------------------------------------------
--                                                                          --
--                            Matreshka Project                             --
--                                                                          --
--         Localization, Internationalization, Globalization for Ada        --
--                                                                          --
--                              Tools Component                             --
--                                                                          --
------------------------------------------------------------------------------
--                                                                          --
-- Copyright © 2011-2015, Vadim Godunko <vgodunko@gmail.com>                --
-- All rights reserved.                                                     --
--                                                                          --
-- Redistribution and use in source and binary forms, with or without       --
-- modification, are permitted provided that the following conditions       --
-- are met:                                                                 --
--                                                                          --
--  * Redistributions of source code must retain the above copyright        --
--    notice, this list of conditions and the following disclaimer.         --
--                                                                          --
--  * Redistributions in binary form must reproduce the above copyright     --
--    notice, this list of conditions and the following disclaimer in the   --
--    documentation and/or other materials provided with the distribution.  --
--                                                                          --
--  * Neither the name of the Vadim Godunko, IE nor the names of its        --
--    contributors may be used to endorse or promote products derived from  --
--    this software without specific prior written permission.              --
--                                                                          --
-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS      --
-- "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT        --
-- LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR    --
-- A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT     --
-- HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,   --
-- SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED --
-- TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR   --
-- PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF   --
-- LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING     --
-- NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS       --
-- SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.             --
--                                                                          --
------------------------------------------------------------------------------
--  $Revision$ $Date$
------------------------------------------------------------------------------

with Ada.Wide_Wide_Text_IO;

package body UAFLEX.Nodes is

   --------------
   -- Add_Rule --
   --------------

   procedure Add_Rule
     (RegExp : League.Strings.Universal_String;
      Action : League.Strings.Universal_String;
      Line   : Positive)
   is
      procedure Add
        (Name      : League.Strings.Universal_String;
         Condition : in out Start_Condition);

      procedure Add_Inclusive
        (Name      : League.Strings.Universal_String;
         Condition : in out Start_Condition);

      procedure Each_Inclusive (Cursor : Start_Condition_Maps.Cursor);

      function Get_Action
        (Text : League.Strings.Universal_String)
        return Positive;

      Text  : League.Strings.Universal_String := RegExp;
      To    : constant Natural := Text.Index ('>');
      Index : Positive;

      ---------
      -- Add --
      ---------

      procedure Add
        (Name      : League.Strings.Universal_String;
         Condition : in out Start_Condition)
      is
         pragma Unreferenced (Name);
      begin
         Condition.Rules.Append (Index);
      end Add;

      -------------------
      -- Add_Inclusive --
      -------------------

      procedure Add_Inclusive
        (Name      : League.Strings.Universal_String;
         Condition : in out Start_Condition) is
      begin
         if not Condition.Exclusive then
            Add (Name, Condition);
         end if;
      end Add_Inclusive;

      --------------------
      -- Each_Inclusive --
      --------------------

      procedure Each_Inclusive (Cursor : Start_Condition_Maps.Cursor) is
      begin
         Conditions.Update_Element (Cursor, Add_Inclusive'Access);
      end Each_Inclusive;

      --------------------
      -- Get_Action --
      --------------------

      function Get_Action
        (Text : League.Strings.Universal_String)
        return Positive is
      begin
         for J in 1 .. Actions.Length loop
            if Actions.Element (J) = Text then
               return J;
            end if;
         end loop;

         Actions.Append (Action);

         return Actions.Length;
      end Get_Action;
   begin
      Indexes.Append (Get_Action (Action));
      Index := Rules.Length + 1;

      if Text.Starts_With ("<") then
         declare
            Conditions : constant League.Strings.Universal_String :=
              Text.Slice (2, To - 1);
            List : constant League.String_Vectors.Universal_String_Vector :=
              Conditions.Split (',');
         begin
            for J in 1 .. List.Length loop
               declare
                  Condition : constant League.Strings.Universal_String :=
                    List.Element (J);
                  Cursor : constant Start_Condition_Maps.Cursor :=
                    Nodes.Conditions.Find (Condition);
               begin
                  if Start_Condition_Maps.Has_Element (Cursor) then
                     Nodes.Conditions.Update_Element (Cursor, Add'Access);
                  else
                     Ada.Wide_Wide_Text_IO.Put_Line
                       ("Line:" & Natural'Wide_Wide_Image (Line) & " " &
                          "No such start condition: " &
                          Condition.To_Wide_Wide_String);
                     Success := False;
                  end if;
               end;
            end loop;

            Text.Slice (To + 1, Text.Length);
         end;
      else
         Conditions.Iterate (Each_Inclusive'Access);
      end if;

      Rules.Append (Text);
      Lines.Append (Line);
   end Add_Rule;

   --------------------------
   -- Add_Start_Conditions --
   --------------------------

   procedure Add_Start_Conditions
     (List      : League.String_Vectors.Universal_String_Vector;
      Exclusive : Boolean) is
   begin
      for J in 1 .. List.Length loop
         Conditions.Insert (List.Element (J), (Exclusive, others => <>));
      end loop;
   end Add_Start_Conditions;

   function To_Node (Value : League.Strings.Universal_String) return Node is
   begin
      return (Text, Value);
   end To_Node;

   function To_Action (Value : League.Strings.Universal_String) return Node is
   begin
      return To_Node (Value.Slice (2, Value.Length - 1));
   end To_Action;

end UAFLEX.Nodes;
