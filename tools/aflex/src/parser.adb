with Ada.Integer_Wide_Wide_Text_IO;
with Ada.Strings.Wide_Wide_Unbounded.Wide_Wide_Text_IO;
with Ada.Wide_Wide_Text_IO;

with Scanner;
with NFA, ccl, misc, misc_defs, sym, ecs;
with main_body;
with Matreshka.Internals.Unicode.Ucd.Core;
with Unicode;

with Parser.Goto_Table;
use  Parser.Goto_Table;
with Parser_Tokens;
use  Parser_Tokens;
with Parser.Shift_Reduce;
use  Parser.Shift_Reduce;

package body Parser is
   package Parser_Goto renames Parser.Goto_Table;
   package Parser_Shift_Reduce  renames Parser.Shift_Reduce;

   use Ada.Integer_Wide_Wide_Text_IO;
   use Ada.Strings.Wide_Wide_Unbounded;
   use Ada.Strings.Wide_Wide_Unbounded.Wide_Wide_Text_IO;
   use Ada.Wide_Wide_Text_IO;

   use Scanner;
   use Unicode;
   use Matreshka.Internals.Unicode.Ucd;
   use misc_defs;

   function "+" (Item : Wide_Wide_String) return Unbounded_Wide_Wide_String
     renames To_Unbounded_Wide_Wide_String;

   function Element is
     new Matreshka.Internals.Unicode.Ucd.Generic_Element
      (Matreshka.Internals.Unicode.Ucd.Core_Values,
       Matreshka.Internals.Unicode.Ucd.Core_Second_Stage,
       Matreshka.Internals.Unicode.Ucd.Core_Second_Stage_Access,
       Matreshka.Internals.Unicode.Ucd.Core_First_Stage);

   ----------------------
   -- Build_EOF_Action --
   ----------------------

   -- Build_EOF_Action - build the "<<EOF>>" action for the active start
   --                    conditions

   procedure Build_EOF_Action is
   begin
      Put (Temp_Action_File, "when ");

      for i in 1..actvp loop
         if sceof (actvsc (i)) then
            Put
              (Standard_Error, "multiple <<EOF>> rules for start condition ");
	    Put (Standard_Error, scname (actvsc (i)));
	    Main_Body.Aflex_End (1);

	else
	    sceof (actvsc (i)) := true;
	    Put (Temp_Action_File, "YY_END_OF_BUFFER +");
	    Put (Temp_Action_File, scname (actvsc (i)));
	    Put_Line (Temp_Action_File, " + 1 ");

            if (i /= actvp) then
               Put_Line (Temp_Action_File, " |");
            else
               Put_Line (Temp_Action_File, " =>");
	    end if;
         end if;
      end loop;

     misc.line_directive_out( temp_action_file );
   end Build_EOF_Action;

   -------------
   -- YYError --
   -------------

   --  yyerror - eat up an error message from the parser
   --
   --  synopsis
   --     char msg[];
   --     yyerror( msg );

   procedure YYError (msg : string) is
   begin
      null;
   end YYError;

procedure YYParse is

   -- Rename User Defined Packages to Internal Names.
    package yy_goto_tables         renames
      Parser.Goto_Table;
    package yy_shift_reduce_tables renames
      Parser.Shift_Reduce;
    package yy_tokens              renames
      Parser_Tokens;

   use yy_tokens, yy_goto_tables, yy_shift_reduce_tables;

   procedure yyerrok;
   procedure yyclearin;


   package yy is

       -- the size of the value and state stacks
       stack_size : constant Natural := 300;

       -- subtype rule         is natural;
       subtype parse_state  is natural;
       -- subtype nonterminal  is integer;

       -- encryption constants
       default           : constant := -1;
       first_shift_entry : constant :=  0;
       accept_code       : constant := -3001;
       error_code        : constant := -3000;

       -- stack data used by the parser
       tos                : natural := 0;
       value_stack        : array(0..stack_size) of yy_tokens.yystype;
       state_stack        : array(0..stack_size) of parse_state;

       -- current input symbol and action the parser is on
       action             : integer;
       rule_id            : rule;
       input_symbol       : yy_tokens.token;


       -- error recovery flag
       error_flag : natural := 0;
          -- indicates  3 - (number of valid shifts after an error occurs)

       look_ahead : boolean := true;
       index      : integer;

       -- Is Debugging option on or off
        DEBUG : constant boolean := FALSE;

    end yy;


    function goto_state
      (state : yy.parse_state;
       sym   : nonterminal) return yy.parse_state;

    function parse_action
      (state : yy.parse_state;
       t     : yy_tokens.token) return integer;

    pragma inline(goto_state, parse_action);


    function goto_state(state : yy.parse_state;
                        sym   : nonterminal) return yy.parse_state is
        index : integer;
    begin
        index := goto_offset(state);
        while  integer(goto_matrix(index).nonterm) /= sym loop
            index := index + 1;
        end loop;
        return integer(goto_matrix(index).newstate);
    end goto_state;


    function parse_action(state : yy.parse_state;
                          t     : yy_tokens.token) return integer is
        index      : integer;
        tok_pos    : integer;
        default    : constant integer := -1;
    begin
        tok_pos := yy_tokens.token'pos(t);
        index   := shift_reduce_offset(state);
        while integer(shift_reduce_matrix(index).t) /= tok_pos and then
              integer(shift_reduce_matrix(index).t) /= default
        loop
            index := index + 1;
        end loop;
        return integer(shift_reduce_matrix(index).act);
    end parse_action;

-- error recovery stuff

    procedure handle_error is
      temp_action : integer;
    begin

      if yy.error_flag = 3 then -- no shift yet, clobber input.
      if yy.debug then
          Ada.Wide_Wide_Text_Io.Put_Line ("Ayacc.YYParse: Error Recovery Clobbers " &
                   yy_tokens.token'Wide_Wide_Image (yy.input_symbol));
      end if;
        if yy.input_symbol = yy_tokens.end_of_input then  -- don't discard,
        if yy.debug then
            Ada.Wide_Wide_Text_IO.Put_Line ("Ayacc.YYParse: Can't discard END_OF_INPUT, quiting...");
        end if;
        raise yy_tokens.syntax_error;
        end if;

            yy.look_ahead := true;   -- get next token
        return;                  -- and try again...
    end if;

    if yy.error_flag = 0 then -- brand new error
        yyerror("Syntax Error");
    end if;

    yy.error_flag := 3;

    -- find state on stack where error is a valid shift --

    if yy.debug then
        Ada.Wide_Wide_Text_IO.Put_Line ("Ayacc.YYParse: Looking for state with error as valid shift");
    end if;

    loop
        if yy.debug then
          Ada.Wide_Wide_Text_IO.Put_Line ("Ayacc.YYParse: Examining State " &
               yy.parse_state'Wide_Wide_Image (yy.state_stack(yy.tos)));
        end if;
        temp_action := parse_action(yy.state_stack(yy.tos), error);

            if temp_action >= yy.first_shift_entry then
                if yy.tos = yy.stack_size then
                    Ada.Wide_Wide_Text_IO.Put_Line (" Stack size exceeded on state_stack");
                    raise yy_Tokens.syntax_error;
                end if;
                yy.tos := yy.tos + 1;
                yy.state_stack(yy.tos) := temp_action;
                exit;
            end if;

        Decrement_Stack_Pointer :
        begin
          yy.tos := yy.tos - 1;
        exception
          when Constraint_Error =>
            yy.tos := 0;
        end Decrement_Stack_Pointer;

        if yy.tos = 0 then
          if yy.debug then
            Ada.Wide_Wide_Text_IO.Put_Line ("Ayacc.YYParse: Error recovery popped entire stack, aborting...");
          end if;
          raise yy_tokens.syntax_error;
        end if;
    end loop;

    if yy.debug then
        Ada.Wide_Wide_Text_IO.Put_Line ("Ayacc.YYParse: Shifted error token in state " &
              yy.parse_state'Wide_Wide_Image (yy.state_stack(yy.tos)));
    end if;

    end handle_error;

   -- print debugging information for a shift operation
   procedure shift_debug(state_id: yy.parse_state; lexeme: yy_tokens.token) is
   begin
       Ada.Wide_Wide_Text_IO.Put_Line ("Ayacc.YYParse: Shift "& yy.parse_state'Wide_Wide_Image (state_id)&" on input symbol "&
               yy_tokens.token'Wide_Wide_Image (lexeme));
   end;

   -- print debugging information for a reduce operation
   procedure reduce_debug(rule_id: rule; state_id: yy.parse_state) is
   begin
       Ada.Wide_Wide_Text_IO.Put_Line ("Ayacc.YYParse: Reduce by rule "&rule'Wide_Wide_Image (rule_id)&" goto state "&
               yy.parse_state'Wide_Wide_Image (state_id));
   end;

   -- make the parser believe that 3 valid shifts have occured.
   -- used for error recovery.
   procedure yyerrok is
   begin
       yy.error_flag := 0;
   end yyerrok;

   -- called to clear input symbol that caused an error.
   procedure yyclearin is
   begin
       -- yy.input_symbol := yylex;
       yy.look_ahead := true;
   end yyclearin;


begin
    -- initialize by pushing state 0 and getting the first input symbol
    yy.state_stack(yy.tos) := 0;


    loop

        yy.index := shift_reduce_offset(yy.state_stack(yy.tos));
        if integer(shift_reduce_matrix(yy.index).t) = yy.default then
            yy.action := integer(shift_reduce_matrix(yy.index).act);
        else
            if yy.look_ahead then
                yy.look_ahead   := false;

                yy.input_symbol := yylex;
            end if;
            yy.action :=
             parse_action(yy.state_stack(yy.tos), yy.input_symbol);
        end if;


        if yy.action >= yy.first_shift_entry then  -- SHIFT

            if yy.debug then
                shift_debug(yy.action, yy.input_symbol);
            end if;

            -- Enter new state
            if yy.tos = yy.stack_size then
                Ada.Wide_Wide_Text_IO.Put_Line (" Stack size exceeded on state_stack");
                raise yy_Tokens.syntax_error;
            end if;
            yy.tos := yy.tos + 1;
            yy.state_stack(yy.tos) := yy.action;
              yy.value_stack(yy.tos) := yylval;

        if yy.error_flag > 0 then  -- indicate a valid shift
            yy.error_flag := yy.error_flag - 1;
        end if;

            -- Advance lookahead
            yy.look_ahead := true;

        elsif yy.action = yy.error_code then       -- ERROR

            handle_error;

        elsif yy.action = yy.accept_code then
            if yy.debug then
                Ada.Wide_Wide_Text_IO.Put_Line ("Ayacc.YYParse: Accepting Grammar...");
            end if;
            exit;

        else -- Reduce Action

            -- Convert action into a rule
            yy.rule_id  := -1 * yy.action;

            -- Execute User Action
            -- user_action(yy.rule_id);


                case yy.rule_id is

when 1 =>
--# line 34 "parser.y"
 -- add default rule

			pat := ccl.cclinit;
			ccl.cclnegate( pat );

			def_rule := nfa.mkstate( -pat );

			nfa.finish_rule( def_rule, false, 0, 0 );

			for i in 1 .. lastsc loop
			    scset(i) := nfa.mkbranch( scset(i), def_rule );
			end loop;

			if ( spprdflt ) then
			    Put
                             (Temp_Action_File, "raise AFLEX_SCANNER_JAMMED;");
			else
			    Put (Temp_Action_File, "ECHO");

                            Put_Line (Temp_Action_File, ";");
			end if;
			

when 2 =>
--# line 59 "parser.y"

			-- initialize for processing rules

       			-- create default DFA start condition
			sym.scinstal (+"INITIAL", False);
			

when 5 =>
--# line 70 "parser.y"
 misc.synerr( "unknown error processing section 1" );

when 7 =>
--# line 77 "parser.y"

			 -- these productions are separate from the s1object
			 -- rule because the semantics must be done before
			 -- we parse the remainder of an s1object


			xcluflg := false;
			

when 8 =>
--# line 87 "parser.y"
 xcluflg := true; 

when 9 =>
--# line 91 "parser.y"
 sym.scinstal (nmstr, xcluflg); 

when 10 =>
--# line 94 "parser.y"
 sym.scinstal (nmstr, xcluflg); 

when 11 =>
--# line 97 "parser.y"
 misc.synerr( "bad start condition list" ); 

when 14 =>
--# line 105 "parser.y"

			-- initialize for a parse of one rule
			trlcontxt := false;
			variable_trail_rule := false;
			varlength := false;
			trailcnt := 0;
			headcnt := 0;
			rulelen := 0;
			current_state_enum := STATE_NORMAL;
			previous_continued_action := continued_action;
			nfa.new_rule;
			

when 15 =>
--# line 120 "parser.y"

			pat := nfa.link_machines( yy.value_stack (yy.tos-1), yy.value_stack (yy.tos) );
			nfa.finish_rule( pat, variable_trail_rule,
				     headcnt, trailcnt );

			for i in 1 .. actvp loop
			    scbol(actvsc(i)) :=
				nfa.mkbranch( scbol(actvsc(i)), pat );
			end loop;

			if ( not bol_needed ) then
			    bol_needed := true;

			    if ( performance_report ) then
				Put (Standard_Error,
			"'^' operator results in sub-optimal performance");
			        New_Line (Standard_Error);
    	    	    	    end if;
			end if;
			

when 16 =>
--# line 142 "parser.y"

			pat := nfa.link_machines( yy.value_stack (yy.tos-1), yy.value_stack (yy.tos) );
			nfa.finish_rule( pat, variable_trail_rule,
				     headcnt, trailcnt );

			for i in 1 .. actvp loop
			    scset(actvsc(i)) :=
				nfa.mkbranch( scset(actvsc(i)), pat );
			end loop;
		        

when 17 =>
--# line 153 "parser.y"

			pat := nfa.link_machines( yy.value_stack (yy.tos-1), yy.value_stack (yy.tos) );
			nfa.finish_rule( pat, variable_trail_rule,
				     headcnt, trailcnt );

			-- add to all non-exclusive start conditions,
			-- including the default (0) start condition

			for i in 1 .. lastsc loop
			    if ( not scxclu(i) ) then
				scbol(i) := nfa.mkbranch( scbol(i), pat );
			    end if;
			end loop;

			if ( not bol_needed ) then
			    bol_needed := true;

			    if ( performance_report ) then
				Put (Standard_Error,
			"'^' operator results in sub-optimal performance");
			        New_Line (Standard_Error);
			    end if;
			end if;
    	    	    	

when 18 =>
--# line 178 "parser.y"

			pat := nfa.link_machines( yy.value_stack (yy.tos-1), yy.value_stack (yy.tos) );
			nfa.finish_rule( pat, variable_trail_rule,
				     headcnt, trailcnt );

			for i in 1 .. lastsc loop
			    if ( not scxclu(i) ) then
				scset(i) := nfa.mkbranch( scset(i), pat );
			    end if;
			end loop;
			

when 19 =>
--# line 191 "parser.y"
 Build_EOF_Action; 

when 20 =>
--# line 194 "parser.y"

                  -- this EOF applies only to the INITIAL start cond.
                  actvp := 1;
                  actvsc(actvp) := 1;
                  Build_EOF_Action;
			

when 21 =>
--# line 202 "parser.y"
 misc.synerr( "unrecognized rule" ); 

when 23 =>
--# line 209 "parser.y"

			scnum := sym.sclookup (nmstr);
			if (scnum = 0 ) then
		            Put
                             (Standard_Error, "undeclared start condition ");
		            Put (Standard_Error, nmstr);
			    Main_Body.Aflex_End (1);

			else
			  actvp := actvp + 1;
			    actvsc(actvp) := scnum;
			end if;
			

when 24 =>
--# line 224 "parser.y"

			scnum := sym.sclookup (nmstr);
			if (scnum = 0 ) then
		            Put
                             (Standard_Error, "undeclared start condition ");
		            Put (Standard_Error, nmstr);
			    Main_Body.Aflex_End (1);

			else
			    actvp := 1;
			    actvsc(actvp) := scnum;
			end if;
			

when 25 =>
--# line 239 "parser.y"
 misc.synerr( "bad start condition list" ); 

when 26 =>
--# line 243 "parser.y"

			if trlcontxt then
			    misc.synerr( "trailing context used twice" );
			    yyval := nfa.mkstate( SYM_EPSILON );
			else
			    trlcontxt := true;

			    if ( not varlength ) then
				headcnt := rulelen;
			    end if;

			    rulelen := rulelen + 1;
			    trailcnt := 1;

			    eps := nfa.mkstate( SYM_EPSILON );
			    yyval := nfa.link_machines( eps,
					  nfa.mkstate( CHARACTER'POS(ASCII.LF) ) );
    	    	    	end if;
			

when 27 =>
--# line 264 "parser.y"

		        yyval := nfa.mkstate( SYM_EPSILON );

			if ( trlcontxt ) then
			    if ( varlength and (headcnt = 0) ) then
				-- both head and trail are variable-length
				variable_trail_rule := true;
			    else
				trailcnt := rulelen;
			    end if;
    	    	    	end if;
		        

when 28 =>
--# line 279 "parser.y"

			varlength := true;

			yyval := nfa.mkor( yy.value_stack (yy.tos-2), yy.value_stack (yy.tos) );
			

when 29 =>
--# line 286 "parser.y"

			if ( transchar(lastst(yy.value_stack (yy.tos))) /= SYM_EPSILON ) then
			    -- provide final transition \now/ so it
			    -- will be marked as a trailing context
			    -- state

			    yy.value_stack (yy.tos) := nfa.link_machines( yy.value_stack (yy.tos), nfa.mkstate( SYM_EPSILON ) );
			end if;

			nfa.mark_beginning_as_normal( yy.value_stack (yy.tos) );
			current_state_enum := STATE_NORMAL;

			if ( previous_continued_action ) then
			    -- we need to treat this as variable trailing
			    -- context so that the backup does not happen
			    -- in the action but before the action switch
			    -- statement.  If the backup happens in the
			    -- action, then the rules "falling into" this
			    -- one's action will *also* do the backup,
			    -- erroneously.

			    	if ( (not varlength) or  headcnt /= 0 ) then
				     Put (Standard_Error,
                              "aflex: warning - trailing context rule at line");
                                     Put (Standard_Error, Linenum);
				     Put (Standard_Error,
                           "made variable because of preceding '|' action" );
                                     Put (Standard_Error, Linenum);
    	    	    	    	end if;

			    -- mark as variable
			    varlength := true;
			    headcnt := 0;
    	    	    	end if;

			if ( varlength and (headcnt = 0) ) then
			    -- variable trailing context rule
			    -- mark the first part of the rule as the accepting
			    -- "head" part of a trailing context rule

			    -- by the way, we didn't do this at the beginning
			    -- of this production because back then
			    -- current_state_enum was set up for a trail
			    -- rule, and add_accept() can create a new
			    -- state ...

			    nfa.add_accept( yy.value_stack (yy.tos-1),
    	    	    	    	   misc.set_yy_trailing_head_mask(num_rules) );
    	    	    	end if;

			yyval := nfa.link_machines( yy.value_stack (yy.tos-1), yy.value_stack (yy.tos) );
			

when 30 =>
--# line 340 "parser.y"
 yyval := yy.value_stack (yy.tos); 

when 31 =>
--# line 345 "parser.y"

			-- this rule is separate from the others for "re" so
			-- that the reduction will occur before the trailing
			-- series is parsed

			if ( trlcontxt ) then
			    misc.synerr( "trailing context used twice" );
			else
			    trlcontxt := true;
			end if;

			if ( varlength ) then
			    -- we hope the trailing context is fixed-length
			    varlength := false;
			else
			    headcnt := rulelen;
			end if;

			rulelen := 0;

			current_state_enum := STATE_TRAILING_CONTEXT;
			yyval := yy.value_stack (yy.tos-1);
			

when 32 =>
--# line 371 "parser.y"

			-- this is where concatenation of adjacent patterns
			-- gets done

			yyval := nfa.link_machines( yy.value_stack (yy.tos-1), yy.value_stack (yy.tos) );
			

when 33 =>
--# line 379 "parser.y"
 yyval := yy.value_stack (yy.tos); 

when 34 =>
--# line 383 "parser.y"

			varlength := true;

			yyval := nfa.mkclos( yy.value_stack (yy.tos-1) );
			

when 35 =>
--# line 390 "parser.y"

			varlength := true;

			yyval := nfa.mkposcl( yy.value_stack (yy.tos-1) );
			

when 36 =>
--# line 397 "parser.y"

			varlength := true;

			yyval := nfa.mkopt( yy.value_stack (yy.tos-1) );
			

when 37 =>
--# line 404 "parser.y"

			varlength := true;

			if ( (yy.value_stack (yy.tos-3) > yy.value_stack (yy.tos-1)) or (yy.value_stack (yy.tos-3) < 0) ) then
			    misc.synerr( "bad iteration values" );
			    yyval := yy.value_stack (yy.tos-5);
			else
			    if ( yy.value_stack (yy.tos-3) = 0 ) then
				yyval := nfa.mkopt( nfa.mkrep( yy.value_stack (yy.tos-5), yy.value_stack (yy.tos-3), yy.value_stack (yy.tos-1) ) );
			    else
				yyval := nfa.mkrep( yy.value_stack (yy.tos-5), yy.value_stack (yy.tos-3), yy.value_stack (yy.tos-1) );
			    end if;
    	    	    	end if;
			

when 38 =>
--# line 420 "parser.y"

			varlength := true;

			if ( yy.value_stack (yy.tos-2) <= 0 ) then
			    misc.synerr( "iteration value must be positive" );
			    yyval := yy.value_stack (yy.tos-4);
			else
			    yyval := nfa.mkrep( yy.value_stack (yy.tos-4), yy.value_stack (yy.tos-2), INFINITY );
			end if;
			

when 39 =>
--# line 432 "parser.y"

			-- the singleton could be something like "(foo)",
			-- in which case we have no idea what its length
			-- is, so we punt here.

			varlength := true;

			if ( yy.value_stack (yy.tos-1) <= 0 ) then
			    misc.synerr( "iteration value must be positive" );
			    yyval := yy.value_stack (yy.tos-3);
			else
			    yyval := nfa.link_machines( yy.value_stack (yy.tos-3), nfa.copysingl( yy.value_stack (yy.tos-3), yy.value_stack (yy.tos-1) - 1 ) );
			end if;
			

when 40 =>
--# line 448 "parser.y"

			if ( not madeany ) then
			    -- create the '.' character class
			    anyccl := ccl.cclinit;
			    ccl.ccl_add( anyccl, Unicode.LF );
			    ccl.cclnegate( anyccl );

			    if ( useecs ) then
				ecs.mkeccl(
		       ccltbl(cclmap(anyccl)..cclmap(anyccl) + ccllen(anyccl)),
					ccllen(anyccl), nextecm,
					ecgroup, CSIZE );
			    end if;
			    madeany := true;
    	    	    	end if;

			rulelen := rulelen + 1;

			yyval := nfa.mkstate( -anyccl );
			

when 41 =>
--# line 470 "parser.y"

			if ( not cclsorted ) then
			    -- sort characters for fast searching.  We use a
			    -- shell sort since this list could be large.

--			    misc.cshell( ccltbl + cclmap($1), ccllen($1) );
		      misc.cshell( ccltbl(cclmap(yy.value_stack (yy.tos))..cclmap(yy.value_stack (yy.tos)) + ccllen(yy.value_stack (yy.tos))),
				   ccllen(yy.value_stack (yy.tos)) );
			end if;

			if ( useecs ) then
		    ecs.mkeccl( ccltbl(cclmap(yy.value_stack (yy.tos))..cclmap(yy.value_stack (yy.tos)) + ccllen(yy.value_stack (yy.tos))),
				ccllen(yy.value_stack (yy.tos)),nextecm, ecgroup, CSIZE );
			end if;

			rulelen := rulelen + 1;

			yyval := nfa.mkstate( -yy.value_stack (yy.tos) );
			

when 42 =>
--# line 491 "parser.y"

			rulelen := rulelen + 1;

			yyval := nfa.mkstate( -yy.value_stack (yy.tos) );
			

when 43 =>
--# line 498 "parser.y"
 yyval := yy.value_stack (yy.tos-1); 

when 44 =>
--# line 501 "parser.y"
 yyval := yy.value_stack (yy.tos-1); 

when 45 =>
--# line 504 "parser.y"

			rulelen := rulelen + 1;

			if ( yy.value_stack (yy.tos) = CHARACTER'POS(ASCII.NUL) ) then
			    misc.synerr( "null in rule" );
			end if;

			if ( caseins and (yy.value_stack (yy.tos) >= CHARACTER'POS('A')) and (yy.value_stack (yy.tos) <= CHARACTER'POS('Z')) ) then
			    yy.value_stack (yy.tos) := misc.clower( yy.value_stack (yy.tos) );
			end if;

			yyval := nfa.mkstate( yy.value_stack (yy.tos) );
			

when 46 =>
--# line 518 "parser.y"

			rulelen := rulelen + 1;

			declare
			   P : Matreshka.Internals.Unicode.Ucd.Boolean_Properties :=
			     Matreshka.Internals.Unicode.Ucd.Boolean_Properties'Val ((abs yy.value_stack (yy.tos)) - 1);
			   N : Boolean := yy.value_stack (yy.tos) < 0;

			begin
                           if N then
                              yyval := Boolean_NCCL (P);

                           else
                              yyval := Boolean_CCL (P);
                           end if;

                           if yyval = 0 then
			      cclsorted := true;
			      lastchar := 0;
			      yyval := ccl.cclinit;

			      for J in Unicode_Character'Range loop
                                 if Element (Matreshka.Internals.Unicode.Ucd.Core.Property, Unicode_Character'Pos (J)).B (P) then
			            ccl.ccl_add (yyval, J);
			            lastchar := Unicode_Character'Pos (J);
			         end if;
			      end loop;

			      if ( useecs ) then
			          ecs.mkeccl( ccltbl(cclmap(yyval)..cclmap(yyval) + ccllen(yyval)),
				      ccllen(yyval),nextecm, ecgroup, CSIZE );
			      end if;

			      if N then
			         ccl.cclnegate( yyval );
			         Boolean_NCCL (P) := yyval;

			      else
			         Boolean_CCL (P) := yyval;
			      end if;
			   end if;

			   yyval := nfa.mkstate( -yyval );
			end;
			

when 47 =>
--# line 566 "parser.y"
 yyval := yy.value_stack (yy.tos-1); 

when 48 =>
--# line 569 "parser.y"

			-- *Sigh* - to be compatible Unix lex, negated ccls
			-- match newlines
			ccl.cclnegate( yy.value_stack (yy.tos-1) );
			yyval := yy.value_stack (yy.tos-1);
			

when 49 =>
--# line 578 "parser.y"

			if ( yy.value_stack (yy.tos-2) > yy.value_stack (yy.tos) ) then
			    misc.synerr( "negative range in character class" );
			else
			    if ( caseins ) then
				if ( (yy.value_stack (yy.tos-2) >= CHARACTER'POS('A')) and (yy.value_stack (yy.tos-2) <= CHARACTER'POS('Z')) ) then
				    yy.value_stack (yy.tos-2) := misc.clower( yy.value_stack (yy.tos-2) );
				end if;
				if ( (yy.value_stack (yy.tos) >= CHARACTER'POS('A')) and (yy.value_stack (yy.tos) <= CHARACTER'POS('Z')) ) then
				    yy.value_stack (yy.tos) := misc.clower( yy.value_stack (yy.tos) );
				end if;
    	    	    	    end if;

			    for J in yy.value_stack (yy.tos-2) .. yy.value_stack (yy.tos) loop
			        ccl.ccl_add (yy.value_stack (yy.tos-3), Unicode_Character'Val (J));
    	    	    	    end loop;

			    -- keep track if this ccl is staying in
			    -- alphabetical order

			    cclsorted := cclsorted and (yy.value_stack (yy.tos-2) > lastchar);
			    lastchar := yy.value_stack (yy.tos);
    	    	    	end if;

			yyval := yy.value_stack (yy.tos-3);
			

when 50 =>
--# line 606 "parser.y"

			if ( caseins ) then
			    if ( (yy.value_stack (yy.tos) >= CHARACTER'POS('A')) and (yy.value_stack (yy.tos) <= CHARACTER'POS('Z')) ) then
				yy.value_stack (yy.tos) := misc.clower( yy.value_stack (yy.tos) );
    	    	    	    end if;
			end if;
			ccl.ccl_add (yy.value_stack (yy.tos-1), Unicode_Character'Val (yy.value_stack (yy.tos)));
			cclsorted := cclsorted and (yy.value_stack (yy.tos) > lastchar);
			lastchar := yy.value_stack (yy.tos);
			yyval := yy.value_stack (yy.tos-1);
			

when 51 =>
--# line 618 "parser.y"

			declare
			   P : Matreshka.Internals.Unicode.Ucd.Boolean_Properties :=
			     Matreshka.Internals.Unicode.Ucd.Boolean_Properties'Val ((abs yy.value_stack (yy.tos)) - 1);
			   N : Boolean := yy.value_stack (yy.tos) < 0;

			begin
			   cclsorted := false;
			   lastchar := 0;

			   for J in Unicode_Character'Range loop
                              if N xor Element (Matreshka.Internals.Unicode.Ucd.Core.Property, Unicode_Character'Pos (J)).B (P) then
			         ccl.ccl_add (yy.value_stack (yy.tos-1), J);
			      end if;
			   end loop;

			   yyval := yy.value_stack (yy.tos-1);
			end;
			

when 52 =>
--# line 639 "parser.y"

			cclsorted := true;
			lastchar := 0;
			yyval := ccl.cclinit;
			

when 53 =>
--# line 647 "parser.y"

			if ( caseins ) then
			    if ( (yy.value_stack (yy.tos) >= CHARACTER'POS('A')) and (yy.value_stack (yy.tos) <= CHARACTER'POS('Z')) ) then
				yy.value_stack (yy.tos) := misc.clower( yy.value_stack (yy.tos) );
			    end if;
			end if;

			rulelen := rulelen + 1;

			yyval := nfa.link_machines( yy.value_stack (yy.tos-1), nfa.mkstate( yy.value_stack (yy.tos) ) );
			

when 54 =>
--# line 660 "parser.y"
 yyval := nfa.mkstate( SYM_EPSILON ); 

                    when others => null;
                end case;


            -- Pop RHS states and goto next state
            yy.tos      := yy.tos - rule_length(yy.rule_id) + 1;
            if yy.tos > yy.stack_size then
                Ada.Wide_Wide_Text_IO.Put_Line (" Stack size exceeded on state_stack");
                raise yy_Tokens.syntax_error;
            end if;
            yy.state_stack(yy.tos) := goto_state(yy.state_stack(yy.tos-1) ,
                                 get_lhs_rule(yy.rule_id));

              yy.value_stack(yy.tos) := yyval;

            if yy.debug then
                reduce_debug(yy.rule_id,
                    goto_state(yy.state_stack(yy.tos - 1),
                               get_lhs_rule(yy.rule_id)));
            end if;

        end if;


    end loop;


end yyparse;
end Parser;
