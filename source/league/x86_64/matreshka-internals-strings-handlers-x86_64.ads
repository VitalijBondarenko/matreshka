------------------------------------------------------------------------------
--                                                                          --
--                            Matreshka Project                             --
--                                                                          --
--         Localization, Internationalization, Globalization for Ada        --
--                                                                          --
--                        Runtime Library Component                         --
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
--  This package provides string handler optimized for x86_64.
------------------------------------------------------------------------------
with Matreshka.Internals.Strings.Handlers.Portable_64;

package Matreshka.Internals.Strings.Handlers.X86_64 is

   pragma Preelaborate;

   type X86_64_String_Handler is
     new Matreshka.Internals.Strings.Handlers.Portable_64.Portable_64_String_Handler
       with null record;

   overriding procedure Fill_Null_Terminator
    (Self : X86_64_String_Handler;
     Item : not null Shared_String_Access);

   overriding function Is_Equal
    (Self  : X86_64_String_Handler;
     Left  : not null Shared_String_Access;
     Right : not null Shared_String_Access) return Boolean;

   overriding function Is_Less
    (Self  : X86_64_String_Handler;
     Left  : not null Shared_String_Access;
     Right : not null Shared_String_Access) return Boolean;

   overriding function Is_Greater
    (Self  : X86_64_String_Handler;
     Left  : not null Shared_String_Access;
     Right : not null Shared_String_Access) return Boolean;

   overriding function Is_Less_Or_Equal
    (Self  : X86_64_String_Handler;
     Left  : not null Shared_String_Access;
     Right : not null Shared_String_Access) return Boolean;

   overriding function Is_Greater_Or_Equal
    (Self  : X86_64_String_Handler;
     Left  : not null Shared_String_Access;
     Right : not null Shared_String_Access) return Boolean;

   Handler : aliased X86_64_String_Handler;

end Matreshka.Internals.Strings.Handlers.X86_64;
