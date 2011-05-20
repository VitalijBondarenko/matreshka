------------------------------------------------------------------------------
--                                                                          --
--                            Matreshka Project                             --
--                                                                          --
--                          Ada Modeling Framework                          --
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
with AMF.CMOF.Comments.Collections;
with AMF.CMOF.Elements.Collections;
with AMF.CMOF.Namespaces;
with AMF.CMOF.Package_Merges;
with AMF.CMOF.Packages;
with AMF.Internals.CMOF_Elements;

package AMF.Internals.CMOF_Package_Merges is

   pragma Preelaborate;

   type CMOF_Package_Merge_Proxy is
     limited new AMF.Internals.CMOF_Elements.CMOF_Element_Proxy
       and AMF.CMOF.Package_Merges.CMOF_Package_Merge_Interface
         with null record;

   --  XXX These subprograms are stubs

   overriding function Get_Owned_Element
    (Self : not null access constant CMOF_Package_Merge_Proxy)
       return AMF.CMOF.Elements.Collections.Set_Of_CMOF_Element;

   overriding function Get_Owner
    (Self : not null access constant CMOF_Package_Merge_Proxy)
       return AMF.CMOF.Elements.CMOF_Element;

   overriding function Get_Owned_Comment
    (Self : not null access constant CMOF_Package_Merge_Proxy)
       return AMF.CMOF.Comments.Collections.Set_Of_CMOF_Comment;

   overriding function Get_Related_Element
    (Self : not null access constant CMOF_Package_Merge_Proxy)
       return AMF.CMOF.Elements.Collections.Set_Of_CMOF_Element;

   overriding function Get_Source
    (Self : not null access constant CMOF_Package_Merge_Proxy)
       return AMF.CMOF.Elements.Collections.Set_Of_CMOF_Element;

   overriding function Get_Target
    (Self : not null access constant CMOF_Package_Merge_Proxy)
       return AMF.CMOF.Elements.Collections.Set_Of_CMOF_Element;

   overriding function Get_Receiving_Package
    (Self : not null access constant CMOF_Package_Merge_Proxy)
       return AMF.CMOF.Packages.CMOF_Package;

   overriding procedure Set_Receiving_Package
    (Self : not null access CMOF_Package_Merge_Proxy;
     To   : AMF.CMOF.Packages.CMOF_Package);

   overriding function Get_Merged_Package
    (Self : not null access constant CMOF_Package_Merge_Proxy)
       return AMF.CMOF.Packages.CMOF_Package;

   overriding procedure Set_Merged_Package
    (Self : not null access CMOF_Package_Merge_Proxy;
     To   : AMF.CMOF.Packages.CMOF_Package);

end AMF.Internals.CMOF_Package_Merges;
