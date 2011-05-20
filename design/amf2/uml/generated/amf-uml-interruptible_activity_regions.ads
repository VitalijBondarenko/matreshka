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
--  This file is generated, don't edit it.
------------------------------------------------------------------------------
--  An interruptible activity region is an activity group that supports 
--  termination of tokens flowing in the portions of an activity.
------------------------------------------------------------------------------
limited with AMF.UML.Activity_Edges.Collections;
with AMF.UML.Activity_Groups;
limited with AMF.UML.Activity_Nodes.Collections;

package AMF.UML.Interruptible_Activity_Regions is

   pragma Preelaborate;

   type UML_Interruptible_Activity_Region_Interface is limited interface
     and AMF.UML.Activity_Groups.UML_Activity_Group_Interface;

   type UML_Interruptible_Activity_Region is
     access all UML_Interruptible_Activity_Region_Interface'Class;
   for UML_Interruptible_Activity_Region'Storage_Size use 0;

   not overriding function Get_Interrupting_Edge
    (Self : not null access constant UML_Interruptible_Activity_Region_Interface)
       return AMF.UML.Activity_Edges.Collections.Set_Of_UML_Activity_Edge is abstract;
   --  The edges leaving the region that will abort other tokens flowing in 
   --  the region.

   not overriding function Get_Node
    (Self : not null access constant UML_Interruptible_Activity_Region_Interface)
       return AMF.UML.Activity_Nodes.Collections.Set_Of_UML_Activity_Node is abstract;
   --  Nodes immediately contained in the group.

end AMF.UML.Interruptible_Activity_Regions;
