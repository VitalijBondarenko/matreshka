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
-- Copyright © 2011, Vadim Godunko <vgodunko@gmail.com>                     --
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
--  This procedure detects parameters to link with PostgreSQL client library.
------------------------------------------------------------------------------
with Ada.Containers.Vectors;
with Ada.Strings.Fixed;
with Ada.Text_IO;
with GNAT.Expect;

with COnfigure.Builder;

procedure Configure.PostgreSQL is

   use Ada.Strings;
   use Ada.Strings.Fixed;
   use Ada.Strings.Unbounded;
   use GNAT.Expect;

   package Unbounded_String_Vectors is
     new Ada.Containers.Vectors (Positive, Unbounded_String);

   function Has_Pg_Config return Boolean;
   --  Returns True when pg_config is found.

   function Pg_Libs return Unbounded_String_Vectors.Vector;
   --  Returns command line switches for linker.

   -------------------
   -- Has_Pg_Config --
   -------------------

   function Has_Pg_Config return Boolean is
   begin
      declare
         Status : aliased Integer;
         Output : constant String :=
           Get_Command_Output
            ("pg_config",
             (1 => new String'("--version")),
             "",
             Status'Access,
             True);

      begin
         return Status = 0;
      end;

   exception
      when GNAT.Expect.Invalid_Process =>
         return False;
   end Has_Pg_Config;

   -------------
   -- Pg_Libs --
   -------------

   function Pg_Libs return Unbounded_String_Vectors.Vector is
      Status : aliased Integer;
      Output : constant String :=
        Trim
         (Get_Command_Output
           ("pg_config",
            (1 => new String'("--libs")),
            "",
            Status'Access,
            True),
          Both);
      Aux    : Unbounded_String_Vectors.Vector;
      First  : Positive;
      Last   : Natural;

   begin
      if Status = 0 then
         First := Output'First;
         Last  := Output'First;

         while Last <= Output'Last loop
            if Output (Last) = ' ' then
               --  Parameter separator found, add detected parameter to result.

               Aux.Append (To_Unbounded_String (Output (First .. Last - 1)));

               First := Last;

               --  Skip spaces.

               while First <= Output'Last loop
                  exit when Output (First) /= ' ';

                  First := First + 1;
               end loop;

               Last := First;
            end if;

            Last := Last + 1;
         end loop;
      end if;

      return Aux;
   end Pg_Libs;

begin
   --  Command line parameter has preference other automatic detection.

   if Has_Parameter ("--with-postgresql-libdir") then
      Substitutions.Insert
       (PostgreSQL_Library_Options,
        To_Unbounded_String
         ("""-L"
            & Parameter_Value ("--with-postgresql-libdir")
            & """, ""-lpq"""));

   --  When pg_config is installed, it is used to check whether PostgreSQL is
   --  installed and to retrieve linker switches to link with it.

   elsif Has_Pg_Config then
      declare
         Switches : Unbounded_String_Vectors.Vector := Pg_Libs;
         Aux      : Unbounded_String;

      begin
         --  PostgreSQL client library is not part of pg_config --libs, so add
         --  it first.

         Append (Aux, """-lpq""");

         for J in Switches.First_Index .. Switches.Last_Index loop
            Append (Aux, ", ");
            Append (Aux, '"');
            Append (Aux, Switches.Element (J));
            Append (Aux, '"');
         end loop;

         Substitutions.Insert (PostgreSQL_Library_Options, Aux);
      end;
   end if;

   --  Check that PostgreSQL application can be linked with specified/detected
   --  set of options.

   if Substitutions.Contains (PostgreSQL_Library_Options) then
      if not Configure.Builder.Build ("config.tests/postgresql/") then
         --  Switches don't allow to build application, remove them.

         Substitutions.Delete (PostgreSQL_Library_Options);
      end if;
   end if;

   --  Insert empty value for substitution variable when PostgreSQL driver
   --  module is disabled.

   if not Substitutions.Contains (PostgreSQL_Library_Options) then
      Information ("PostgreSQL driver module is disabled");
      Substitutions.Insert (PostgreSQL_Library_Options, Null_Unbounded_String);
   end if;
end Configure.PostgreSQL;