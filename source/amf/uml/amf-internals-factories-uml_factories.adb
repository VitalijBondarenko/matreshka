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
-- Copyright © 2012, Vadim Godunko <vgodunko@gmail.com>                     --
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
with AMF.Internals.Elements;
with AMF.Internals.Helpers;
with AMF.Internals.Tables.UML_Constructors;
with AMF.Internals.Tables.UML_Metamodel;
with AMF.UML.Holders.Aggregation_Kinds;
with AMF.UML.Holders.Call_Concurrency_Kinds;
with AMF.UML.Holders.Connector_Kinds;
with AMF.UML.Holders.Expansion_Kinds;
with AMF.UML.Holders.Interaction_Operator_Kinds;
with AMF.UML.Holders.Message_Kinds;
with AMF.UML.Holders.Message_Sorts;
with AMF.UML.Holders.Object_Node_Ordering_Kinds;
with AMF.UML.Holders.Parameter_Direction_Kinds;
with AMF.UML.Holders.Parameter_Effect_Kinds;
with AMF.UML.Holders.Pseudostate_Kinds;
with AMF.UML.Holders.Transition_Kinds;
with AMF.UML.Holders.Visibility_Kinds;

package body AMF.Internals.Factories.UML_Factories is

   None_Image : constant League.Strings.Universal_String
     := League.Strings.To_Universal_String ("none");
   Shared_Image : constant League.Strings.Universal_String
     := League.Strings.To_Universal_String ("shared");
   Composite_Image : constant League.Strings.Universal_String
     := League.Strings.To_Universal_String ("composite");

   Sequential_Image : constant League.Strings.Universal_String
     := League.Strings.To_Universal_String ("sequential");
   Guarded_Image : constant League.Strings.Universal_String
     := League.Strings.To_Universal_String ("guarded");
   Concurrent_Image : constant League.Strings.Universal_String
     := League.Strings.To_Universal_String ("concurrent");

   Assembly_Image : constant League.Strings.Universal_String
     := League.Strings.To_Universal_String ("assembly");
   Delegation_Image : constant League.Strings.Universal_String
     := League.Strings.To_Universal_String ("delegation");

   Parallel_Image : constant League.Strings.Universal_String
     := League.Strings.To_Universal_String ("parallel");
   Iterative_Image : constant League.Strings.Universal_String
     := League.Strings.To_Universal_String ("iterative");
   Stream_Image : constant League.Strings.Universal_String
     := League.Strings.To_Universal_String ("stream");

   Seq_Image : constant League.Strings.Universal_String
     := League.Strings.To_Universal_String ("seq");
   Alt_Image : constant League.Strings.Universal_String
     := League.Strings.To_Universal_String ("alt");
   Opt_Image : constant League.Strings.Universal_String
     := League.Strings.To_Universal_String ("opt");
   Break_Image : constant League.Strings.Universal_String
     := League.Strings.To_Universal_String ("break");
   Par_Image : constant League.Strings.Universal_String
     := League.Strings.To_Universal_String ("par");
   Strict_Image : constant League.Strings.Universal_String
     := League.Strings.To_Universal_String ("strict");
   Loop_Image : constant League.Strings.Universal_String
     := League.Strings.To_Universal_String ("loop");
   Critical_Image : constant League.Strings.Universal_String
     := League.Strings.To_Universal_String ("critical");
   Neg_Image : constant League.Strings.Universal_String
     := League.Strings.To_Universal_String ("neg");
   Assert_Image : constant League.Strings.Universal_String
     := League.Strings.To_Universal_String ("assert");
   Ignore_Image : constant League.Strings.Universal_String
     := League.Strings.To_Universal_String ("ignore");
   Consider_Image : constant League.Strings.Universal_String
     := League.Strings.To_Universal_String ("consider");

   Complete_Image : constant League.Strings.Universal_String
     := League.Strings.To_Universal_String ("complete");
   Lost_Image : constant League.Strings.Universal_String
     := League.Strings.To_Universal_String ("lost");
   Found_Image : constant League.Strings.Universal_String
     := League.Strings.To_Universal_String ("found");
   Unknown_Image : constant League.Strings.Universal_String
     := League.Strings.To_Universal_String ("unknown");

   Synch_Call_Image : constant League.Strings.Universal_String
     := League.Strings.To_Universal_String ("synchCall");
   Asynch_Call_Image : constant League.Strings.Universal_String
     := League.Strings.To_Universal_String ("asynchCall");
   Asynch_Signal_Image : constant League.Strings.Universal_String
     := League.Strings.To_Universal_String ("asynchSignal");
   Create_Message_Image : constant League.Strings.Universal_String
     := League.Strings.To_Universal_String ("createMessage");
   Delete_Message_Image : constant League.Strings.Universal_String
     := League.Strings.To_Universal_String ("deleteMessage");
   Reply_Image : constant League.Strings.Universal_String
     := League.Strings.To_Universal_String ("reply");

   Unordered_Image : constant League.Strings.Universal_String
     := League.Strings.To_Universal_String ("unordered");
   Ordered_Image : constant League.Strings.Universal_String
     := League.Strings.To_Universal_String ("ordered");
   LIFO_Image : constant League.Strings.Universal_String
     := League.Strings.To_Universal_String ("LIFO");
   FIFO_Image : constant League.Strings.Universal_String
     := League.Strings.To_Universal_String ("FIFO");

   In_Image : constant League.Strings.Universal_String
     := League.Strings.To_Universal_String ("in");
   Inout_Image : constant League.Strings.Universal_String
     := League.Strings.To_Universal_String ("inout");
   Out_Image : constant League.Strings.Universal_String
     := League.Strings.To_Universal_String ("out");
   Return_Image : constant League.Strings.Universal_String
     := League.Strings.To_Universal_String ("return");

   Create_Image : constant League.Strings.Universal_String
     := League.Strings.To_Universal_String ("create");
   Read_Image : constant League.Strings.Universal_String
     := League.Strings.To_Universal_String ("read");
   Update_Image : constant League.Strings.Universal_String
     := League.Strings.To_Universal_String ("update");
   Delete_Image : constant League.Strings.Universal_String
     := League.Strings.To_Universal_String ("delete");

   Initial_Image : constant League.Strings.Universal_String
     := League.Strings.To_Universal_String ("initial");
   Deep_History_Image : constant League.Strings.Universal_String
     := League.Strings.To_Universal_String ("deepHistory");
   Shallow_History_Image : constant League.Strings.Universal_String
     := League.Strings.To_Universal_String ("shallowHistory");
   Join_Image : constant League.Strings.Universal_String
     := League.Strings.To_Universal_String ("join");
   Fork_Image : constant League.Strings.Universal_String
     := League.Strings.To_Universal_String ("fork");
   Junction_Image : constant League.Strings.Universal_String
     := League.Strings.To_Universal_String ("junction");
   Choice_Image : constant League.Strings.Universal_String
     := League.Strings.To_Universal_String ("choice");
   Entry_Point_Image : constant League.Strings.Universal_String
     := League.Strings.To_Universal_String ("entryPoint");
   Exit_Point_Image : constant League.Strings.Universal_String
     := League.Strings.To_Universal_String ("exitPoint");
   Terminate_Image : constant League.Strings.Universal_String
     := League.Strings.To_Universal_String ("terminate");

   Internal_Image : constant League.Strings.Universal_String
     := League.Strings.To_Universal_String ("internal");
   Local_Image : constant League.Strings.Universal_String
     := League.Strings.To_Universal_String ("local");
   External_Image : constant League.Strings.Universal_String
     := League.Strings.To_Universal_String ("external");

   Public_Image : constant League.Strings.Universal_String
     := League.Strings.To_Universal_String ("public");
   Private_Image : constant League.Strings.Universal_String
     := League.Strings.To_Universal_String ("private");
   Protected_Image : constant League.Strings.Universal_String
     := League.Strings.To_Universal_String ("protected");
   Package_Image : constant League.Strings.Universal_String
     := League.Strings.To_Universal_String ("package");

   -----------------------
   -- Convert_To_String --
   -----------------------

   overriding function Convert_To_String
    (Self      : not null access UML_Factory;
     Data_Type : not null access AMF.CMOF.Data_Types.CMOF_Data_Type'Class;
     Value     : League.Holders.Holder) return League.Strings.Universal_String
   is
      pragma Unreferenced (Self);

      DT : constant AMF.Internals.CMOF_Element
        := AMF.Internals.Elements.Element_Base'Class (Data_Type.all).Element;

   begin
      if DT = AMF.Internals.Tables.UML_Metamodel.MC_UML_Aggregation_Kind then
         declare
            Item : constant AMF.UML.UML_Aggregation_Kind
              := AMF.UML.Holders.Aggregation_Kinds.Element (Value);

         begin
            case Item is
               when AMF.UML.None =>
                  return None_Image;

               when AMF.UML.Shared =>
                  return Shared_Image;

               when AMF.UML.Composite =>
                  return Composite_Image;
            end case;
         end;

      elsif DT = AMF.Internals.Tables.UML_Metamodel.MC_UML_Call_Concurrency_Kind then
         declare
            Item : constant AMF.UML.UML_Call_Concurrency_Kind
              := AMF.UML.Holders.Call_Concurrency_Kinds.Element (Value);

         begin
            case Item is
               when AMF.UML.Sequential =>
                  return Sequential_Image;

               when AMF.UML.Guarded =>
                  return Guarded_Image;

               when AMF.UML.Concurrent =>
                  return Concurrent_Image;
            end case;
         end;

      elsif DT = AMF.Internals.Tables.UML_Metamodel.MC_UML_Connector_Kind then
         declare
            Item : constant AMF.UML.UML_Connector_Kind
              := AMF.UML.Holders.Connector_Kinds.Element (Value);

         begin
            case Item is
               when AMF.UML.Assembly =>
                  return Assembly_Image;

               when AMF.UML.Delegation =>
                  return Delegation_Image;
            end case;
         end;

      elsif DT = AMF.Internals.Tables.UML_Metamodel.MC_UML_Expansion_Kind then
         declare
            Item : constant AMF.UML.UML_Expansion_Kind
              := AMF.UML.Holders.Expansion_Kinds.Element (Value);

         begin
            case Item is
               when AMF.UML.Parallel =>
                  return Parallel_Image;

               when AMF.UML.Iterative =>
                  return Iterative_Image;

               when AMF.UML.Stream =>
                  return Stream_Image;
            end case;
         end;

      elsif DT = AMF.Internals.Tables.UML_Metamodel.MC_UML_Interaction_Operator_Kind then
         declare
            Item : constant AMF.UML.UML_Interaction_Operator_Kind
              := AMF.UML.Holders.Interaction_Operator_Kinds.Element (Value);

         begin
            case Item is
               when AMF.UML.Seq_Operator =>
                  return Seq_Image;

               when AMF.UML.Alt_Operator =>
                  return Alt_Image;

               when AMF.UML.Opt_Operator =>
                  return Opt_Image;

               when AMF.UML.Break_Operator =>
                  return Break_Image;

               when AMF.UML.Par_Operator =>
                  return Par_Image;

               when AMF.UML.Strict_Operator =>
                  return Strict_Image;

               when AMF.UML.Loop_Operator =>
                  return Loop_Image;

               when AMF.UML.Critical_Operator =>
                  return Critical_Image;

               when AMF.UML.Neg_Operator =>
                  return Neg_Image;

               when AMF.UML.Assert_Operator =>
                  return Assert_Image;

               when AMF.UML.Ignore_Operator =>
                  return Ignore_Image;

               when AMF.UML.Consider_Operator =>
                  return Consider_Image;
            end case;
         end;

      elsif DT = AMF.Internals.Tables.UML_Metamodel.MC_UML_Message_Kind then
         declare
            Item : constant AMF.UML.UML_Message_Kind
              := AMF.UML.Holders.Message_Kinds.Element (Value);

         begin
            case Item is
               when AMF.UML.Complete =>
                  return Complete_Image;

               when AMF.UML.Lost =>
                  return Lost_Image;

               when AMF.UML.Found =>
                  return Found_Image;

               when AMF.UML.Unknown =>
                  return Unknown_Image;
            end case;
         end;

      elsif DT = AMF.Internals.Tables.UML_Metamodel.MC_UML_Message_Sort then
         declare
            Item : constant AMF.UML.UML_Message_Sort
              := AMF.UML.Holders.Message_Sorts.Element (Value);

         begin
            case Item is
               when AMF.UML.Synch_Call =>
                  return Synch_Call_Image;

               when AMF.UML.Asynch_Call =>
                  return Asynch_Call_Image;

               when AMF.UML.Asynch_Signal =>
                  return Asynch_Signal_Image;

               when AMF.UML.Create_Message =>
                  return Create_Message_Image;

               when AMF.UML.Delete_Message =>
                  return Delete_Message_Image;

               when AMF.UML.Reply =>
                  return Reply_Image;
            end case;
         end;

      elsif DT = AMF.Internals.Tables.UML_Metamodel.MC_UML_Object_Node_Ordering_Kind then
         declare
            Item : constant AMF.UML.UML_Object_Node_Ordering_Kind
              := AMF.UML.Holders.Object_Node_Ordering_Kinds.Element (Value);

         begin
            case Item is
               when AMF.UML.Unordered =>
                  return Unordered_Image;

               when AMF.UML.Ordered =>
                  return Ordered_Image;

               when AMF.UML.LIFO =>
                  return LIFO_Image;

               when AMF.UML.FIFO =>
                  return FIFO_Image;
            end case;
         end;

      elsif DT = AMF.Internals.Tables.UML_Metamodel.MC_UML_Parameter_Direction_Kind then
         declare
            Item : constant AMF.UML.UML_Parameter_Direction_Kind
              := AMF.UML.Holders.Parameter_Direction_Kinds.Element (Value);

         begin
            case Item is
               when AMF.UML.In_Parameter =>
                  return In_Image;

               when AMF.UML.In_Out_Parameter =>
                  return Inout_Image;

               when AMF.UML.Out_Parameter =>
                  return Out_Image;

               when AMF.UML.Return_Parameter =>
                  return Return_Image;
            end case;
         end;

      elsif DT = AMF.Internals.Tables.UML_Metamodel.MC_UML_Parameter_Effect_Kind then
         declare
            Item : constant AMF.UML.UML_Parameter_Effect_Kind
              := AMF.UML.Holders.Parameter_Effect_Kinds.Element (Value);

         begin
            case Item is
               when AMF.UML.Create =>
                  return Create_Image;

               when AMF.UML.Read =>
                  return Read_Image;

               when AMF.UML.Update =>
                  return Update_Image;

               when AMF.UML.Delete =>
                  return Delete_Image;
            end case;
         end;

      elsif DT = AMF.Internals.Tables.UML_Metamodel.MC_UML_Pseudostate_Kind then
         declare
            Item : constant AMF.UML.UML_Pseudostate_Kind
              := AMF.UML.Holders.Pseudostate_Kinds.Element (Value);

         begin
            case Item is
               when AMF.UML.Initial_Pseudostate =>
                  return Initial_Image;

               when AMF.UML.Deep_History_Pseudostate =>
                  return Deep_History_Image;

               when AMF.UML.Shallow_History_Pseudostate =>
                  return Shallow_History_Image;

               when AMF.UML.Join_Pseudostate =>
                  return Join_Image;

               when AMF.UML.Fork_Pseudostate =>
                  return Fork_Image;

               when AMF.UML.Junction_Pseudostate =>
                  return Junction_Image;

               when AMF.UML.Choice_Pseudostate =>
                  return Choice_Image;

               when AMF.UML.Entry_Point_Pseudostate =>
                  return Entry_Point_Image;

               when AMF.UML.Exit_Point_Pseudostate =>
                  return Exit_Point_Image;

               when AMF.UML.Terminate_Pseudostate =>
                  return Terminate_Image;
            end case;
         end;

      elsif DT = AMF.Internals.Tables.UML_Metamodel.MC_UML_Transition_Kind then
         declare
            Item : constant AMF.UML.UML_Transition_Kind
              := AMF.UML.Holders.Transition_Kinds.Element (Value);

         begin
            case Item is
               when AMF.UML.Internal =>
                  return Internal_Image;

               when AMF.UML.Local =>
                  return Local_Image;

               when AMF.UML.External =>
                  return External_Image;
            end case;
         end;

      elsif DT = AMF.Internals.Tables.UML_Metamodel.MC_UML_Visibility_Kind then
         declare
            Item : constant AMF.UML.UML_Visibility_Kind
              := AMF.UML.Holders.Visibility_Kinds.Element (Value);

         begin
            case Item is
               when AMF.UML.Public_Visibility =>
                  return Public_Image;

               when AMF.UML.Private_Visibility =>
                  return Private_Image;

               when AMF.UML.Protected_Visibility =>
                  return Protected_Image;

               when AMF.UML.Package_Visibility =>
                  return Package_Image;
            end case;
         end;

      else
         raise Program_Error;
      end if;
   end Convert_To_String;

   ------------
   -- Create --
   ------------

   overriding function Create
    (Self       : not null access UML_Factory;
     Meta_Class : not null access AMF.CMOF.Classes.CMOF_Class'Class)
       return not null AMF.Elements.Element_Access
   is
      pragma Unreferenced (Self);

      MC : constant AMF.Internals.CMOF_Element
        := AMF.Internals.Elements.Element_Base'Class (Meta_Class.all).Element;

   begin
      if MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Abstraction then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Abstraction);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Accept_Call_Action then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Accept_Call_Action);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Accept_Event_Action then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Accept_Event_Action);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Action_Execution_Specification then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Action_Execution_Specification);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Action_Input_Pin then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Action_Input_Pin);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Activity then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Activity);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Activity_Final_Node then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Activity_Final_Node);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Activity_Parameter_Node then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Activity_Parameter_Node);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Activity_Partition then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Activity_Partition);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Actor then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Actor);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Add_Structural_Feature_Value_Action then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Add_Structural_Feature_Value_Action);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Add_Variable_Value_Action then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Add_Variable_Value_Action);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Any_Receive_Event then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Any_Receive_Event);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Artifact then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Artifact);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Association then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Association);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Association_Class then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Association_Class);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Behavior_Execution_Specification then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Behavior_Execution_Specification);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Broadcast_Signal_Action then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Broadcast_Signal_Action);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Call_Behavior_Action then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Call_Behavior_Action);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Call_Event then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Call_Event);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Call_Operation_Action then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Call_Operation_Action);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Central_Buffer_Node then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Central_Buffer_Node);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Change_Event then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Change_Event);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Class then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Class);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Classifier_Template_Parameter then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Classifier_Template_Parameter);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Clause then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Clause);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Clear_Association_Action then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Clear_Association_Action);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Clear_Structural_Feature_Action then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Clear_Structural_Feature_Action);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Clear_Variable_Action then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Clear_Variable_Action);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Collaboration then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Collaboration);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Collaboration_Use then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Collaboration_Use);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Combined_Fragment then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Combined_Fragment);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Comment then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Comment);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Communication_Path then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Communication_Path);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Component then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Component);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Component_Realization then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Component_Realization);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Conditional_Node then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Conditional_Node);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Connectable_Element_Template_Parameter then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Connectable_Element_Template_Parameter);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Connection_Point_Reference then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Connection_Point_Reference);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Connector then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Connector);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Connector_End then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Connector_End);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Consider_Ignore_Fragment then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Consider_Ignore_Fragment);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Constraint then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Constraint);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Continuation then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Continuation);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Control_Flow then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Control_Flow);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Create_Link_Action then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Create_Link_Action);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Create_Link_Object_Action then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Create_Link_Object_Action);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Create_Object_Action then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Create_Object_Action);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Data_Store_Node then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Data_Store_Node);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Data_Type then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Data_Type);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Decision_Node then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Decision_Node);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Dependency then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Dependency);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Deployment then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Deployment);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Deployment_Specification then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Deployment_Specification);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Destroy_Link_Action then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Destroy_Link_Action);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Destroy_Object_Action then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Destroy_Object_Action);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Destruction_Occurrence_Specification then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Destruction_Occurrence_Specification);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Device then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Device);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Duration then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Duration);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Duration_Constraint then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Duration_Constraint);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Duration_Interval then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Duration_Interval);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Duration_Observation then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Duration_Observation);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Element_Import then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Element_Import);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Enumeration then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Enumeration);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Enumeration_Literal then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Enumeration_Literal);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Exception_Handler then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Exception_Handler);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Execution_Environment then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Execution_Environment);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Execution_Occurrence_Specification then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Execution_Occurrence_Specification);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Expansion_Node then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Expansion_Node);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Expansion_Region then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Expansion_Region);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Expression then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Expression);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Extend then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Extend);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Extension then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Extension);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Extension_End then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Extension_End);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Extension_Point then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Extension_Point);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Final_State then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Final_State);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Flow_Final_Node then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Flow_Final_Node);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Fork_Node then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Fork_Node);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Function_Behavior then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Function_Behavior);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Gate then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Gate);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_General_Ordering then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_General_Ordering);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Generalization then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Generalization);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Generalization_Set then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Generalization_Set);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Image then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Image);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Include then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Include);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Information_Flow then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Information_Flow);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Information_Item then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Information_Item);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Initial_Node then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Initial_Node);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Input_Pin then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Input_Pin);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Instance_Specification then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Instance_Specification);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Instance_Value then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Instance_Value);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Interaction then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Interaction);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Interaction_Constraint then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Interaction_Constraint);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Interaction_Operand then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Interaction_Operand);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Interaction_Use then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Interaction_Use);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Interface then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Interface);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Interface_Realization then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Interface_Realization);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Interruptible_Activity_Region then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Interruptible_Activity_Region);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Interval then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Interval);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Interval_Constraint then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Interval_Constraint);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Join_Node then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Join_Node);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Lifeline then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Lifeline);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Link_End_Creation_Data then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Link_End_Creation_Data);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Link_End_Data then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Link_End_Data);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Link_End_Destruction_Data then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Link_End_Destruction_Data);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Literal_Boolean then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Literal_Boolean);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Literal_Integer then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Literal_Integer);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Literal_Null then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Literal_Null);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Literal_Real then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Literal_Real);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Literal_String then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Literal_String);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Literal_Unlimited_Natural then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Literal_Unlimited_Natural);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Loop_Node then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Loop_Node);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Manifestation then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Manifestation);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Merge_Node then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Merge_Node);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Message then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Message);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Message_Occurrence_Specification then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Message_Occurrence_Specification);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Model then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Model);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Node then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Node);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Object_Flow then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Object_Flow);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Occurrence_Specification then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Occurrence_Specification);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Opaque_Action then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Opaque_Action);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Opaque_Behavior then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Opaque_Behavior);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Opaque_Expression then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Opaque_Expression);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Operation then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Operation);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Operation_Template_Parameter then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Operation_Template_Parameter);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Output_Pin then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Output_Pin);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Package then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Package);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Package_Import then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Package_Import);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Package_Merge then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Package_Merge);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Parameter then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Parameter);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Parameter_Set then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Parameter_Set);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Part_Decomposition then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Part_Decomposition);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Port then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Port);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Primitive_Type then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Primitive_Type);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Profile then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Profile);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Profile_Application then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Profile_Application);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Property then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Property);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Protocol_Conformance then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Protocol_Conformance);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Protocol_State_Machine then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Protocol_State_Machine);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Protocol_Transition then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Protocol_Transition);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Pseudostate then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Pseudostate);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Qualifier_Value then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Qualifier_Value);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Raise_Exception_Action then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Raise_Exception_Action);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Read_Extent_Action then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Read_Extent_Action);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Read_Is_Classified_Object_Action then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Read_Is_Classified_Object_Action);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Read_Link_Action then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Read_Link_Action);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Read_Link_Object_End_Action then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Read_Link_Object_End_Action);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Read_Link_Object_End_Qualifier_Action then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Read_Link_Object_End_Qualifier_Action);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Read_Self_Action then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Read_Self_Action);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Read_Structural_Feature_Action then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Read_Structural_Feature_Action);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Read_Variable_Action then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Read_Variable_Action);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Realization then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Realization);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Reception then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Reception);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Reclassify_Object_Action then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Reclassify_Object_Action);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Redefinable_Template_Signature then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Redefinable_Template_Signature);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Reduce_Action then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Reduce_Action);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Region then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Region);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Remove_Structural_Feature_Value_Action then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Remove_Structural_Feature_Value_Action);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Remove_Variable_Value_Action then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Remove_Variable_Value_Action);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Reply_Action then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Reply_Action);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Send_Object_Action then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Send_Object_Action);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Send_Signal_Action then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Send_Signal_Action);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Sequence_Node then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Sequence_Node);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Signal then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Signal);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Signal_Event then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Signal_Event);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Slot then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Slot);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Start_Classifier_Behavior_Action then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Start_Classifier_Behavior_Action);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Start_Object_Behavior_Action then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Start_Object_Behavior_Action);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_State then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_State);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_State_Invariant then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_State_Invariant);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_State_Machine then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_State_Machine);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Stereotype then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Stereotype);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_String_Expression then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_String_Expression);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Structured_Activity_Node then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Structured_Activity_Node);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Substitution then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Substitution);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Template_Binding then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Template_Binding);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Template_Parameter then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Template_Parameter);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Template_Parameter_Substitution then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Template_Parameter_Substitution);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Template_Signature then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Template_Signature);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Test_Identity_Action then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Test_Identity_Action);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Time_Constraint then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Time_Constraint);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Time_Event then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Time_Event);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Time_Expression then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Time_Expression);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Time_Interval then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Time_Interval);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Time_Observation then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Time_Observation);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Transition then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Transition);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Trigger then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Trigger);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Unmarshall_Action then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Unmarshall_Action);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Usage then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Usage);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Use_Case then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Use_Case);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Value_Pin then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Value_Pin);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Value_Specification_Action then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Value_Specification_Action);

      elsif MC = AMF.Internals.Tables.UML_Metamodel.MC_UML_Variable then
         return
           AMF.Internals.Helpers.To_Element
            (AMF.Internals.Tables.UML_Constructors.Create_UML_Variable);

      else
         raise Program_Error;
      end if;
   end Create;

   ------------------------
   -- Create_From_String --
   ------------------------

   overriding function Create_From_String
    (Self      : not null access UML_Factory;
     Data_Type : not null access AMF.CMOF.Data_Types.CMOF_Data_Type'Class;
     Image     : League.Strings.Universal_String) return League.Holders.Holder
   is
      pragma Unreferenced (Self);

      use type League.Strings.Universal_String;

      DT : constant AMF.Internals.CMOF_Element
        := AMF.Internals.Elements.Element_Base'Class (Data_Type.all).Element;

   begin
      if DT = AMF.Internals.Tables.UML_Metamodel.MC_UML_Aggregation_Kind then
         if Image = None_Image then
            return
              AMF.UML.Holders.Aggregation_Kinds.To_Holder
               (AMF.UML.None);

         elsif Image = Shared_Image then
            return
              AMF.UML.Holders.Aggregation_Kinds.To_Holder
               (AMF.UML.Shared);

         elsif Image = Composite_Image then
            return
              AMF.UML.Holders.Aggregation_Kinds.To_Holder
               (AMF.UML.Composite);

         else
            raise Constraint_Error;
         end if;

      elsif DT = AMF.Internals.Tables.UML_Metamodel.MC_UML_Call_Concurrency_Kind then
         if Image = Sequential_Image then
            return
              AMF.UML.Holders.Call_Concurrency_Kinds.To_Holder
               (AMF.UML.Sequential);

         elsif Image = Guarded_Image then
            return
              AMF.UML.Holders.Call_Concurrency_Kinds.To_Holder
               (AMF.UML.Guarded);

         elsif Image = Concurrent_Image then
            return
              AMF.UML.Holders.Call_Concurrency_Kinds.To_Holder
               (AMF.UML.Concurrent);

         else
            raise Constraint_Error;
         end if;

      elsif DT = AMF.Internals.Tables.UML_Metamodel.MC_UML_Connector_Kind then
         if Image = Assembly_Image then
            return
              AMF.UML.Holders.Connector_Kinds.To_Holder
               (AMF.UML.Assembly);

         elsif Image = Delegation_Image then
            return
              AMF.UML.Holders.Connector_Kinds.To_Holder
               (AMF.UML.Delegation);

         else
            raise Constraint_Error;
         end if;

      elsif DT = AMF.Internals.Tables.UML_Metamodel.MC_UML_Expansion_Kind then
         if Image = Parallel_Image then
            return
              AMF.UML.Holders.Expansion_Kinds.To_Holder
               (AMF.UML.Parallel);

         elsif Image = Iterative_Image then
            return
              AMF.UML.Holders.Expansion_Kinds.To_Holder
               (AMF.UML.Iterative);

         elsif Image = Stream_Image then
            return
              AMF.UML.Holders.Expansion_Kinds.To_Holder
               (AMF.UML.Stream);

         else
            raise Constraint_Error;
         end if;

      elsif DT = AMF.Internals.Tables.UML_Metamodel.MC_UML_Interaction_Operator_Kind then
         if Image = Seq_Image then
            return
              AMF.UML.Holders.Interaction_Operator_Kinds.To_Holder
               (AMF.UML.Seq_Operator);

         elsif Image = Alt_Image then
            return
              AMF.UML.Holders.Interaction_Operator_Kinds.To_Holder
               (AMF.UML.Alt_Operator);

         elsif Image = Opt_Image then
            return
              AMF.UML.Holders.Interaction_Operator_Kinds.To_Holder
               (AMF.UML.Opt_Operator);

         elsif Image = Break_Image then
            return
              AMF.UML.Holders.Interaction_Operator_Kinds.To_Holder
               (AMF.UML.Break_Operator);

         elsif Image = Par_Image then
            return
              AMF.UML.Holders.Interaction_Operator_Kinds.To_Holder
               (AMF.UML.Par_Operator);

         elsif Image = Strict_Image then
            return
              AMF.UML.Holders.Interaction_Operator_Kinds.To_Holder
               (AMF.UML.Strict_Operator);

         elsif Image = Loop_Image then
            return
              AMF.UML.Holders.Interaction_Operator_Kinds.To_Holder
               (AMF.UML.Loop_Operator);

         elsif Image = Critical_Image then
            return
              AMF.UML.Holders.Interaction_Operator_Kinds.To_Holder
               (AMF.UML.Critical_Operator);

         elsif Image = Neg_Image then
            return
              AMF.UML.Holders.Interaction_Operator_Kinds.To_Holder
               (AMF.UML.Neg_Operator);

         elsif Image = Assert_Image then
            return
              AMF.UML.Holders.Interaction_Operator_Kinds.To_Holder
               (AMF.UML.Assert_Operator);

         elsif Image = Ignore_Image then
            return
              AMF.UML.Holders.Interaction_Operator_Kinds.To_Holder
               (AMF.UML.Ignore_Operator);

         elsif Image = Consider_Image then
            return
              AMF.UML.Holders.Interaction_Operator_Kinds.To_Holder
               (AMF.UML.Consider_Operator);

         else
            raise Constraint_Error;
         end if;

      elsif DT = AMF.Internals.Tables.UML_Metamodel.MC_UML_Message_Kind then
         if Image = Complete_Image then
            return
              AMF.UML.Holders.Message_Kinds.To_Holder
               (AMF.UML.Complete);

         elsif Image = Lost_Image then
            return
              AMF.UML.Holders.Message_Kinds.To_Holder
               (AMF.UML.Lost);

         elsif Image = Found_Image then
            return
              AMF.UML.Holders.Message_Kinds.To_Holder
               (AMF.UML.Found);

         elsif Image = Unknown_Image then
            return
              AMF.UML.Holders.Message_Kinds.To_Holder
               (AMF.UML.Unknown);

         else
            raise Constraint_Error;
         end if;

      elsif DT = AMF.Internals.Tables.UML_Metamodel.MC_UML_Message_Sort then
         if Image = Synch_Call_Image then
            return
              AMF.UML.Holders.Message_Sorts.To_Holder
               (AMF.UML.Synch_Call);

         elsif Image = Asynch_Call_Image then
            return
              AMF.UML.Holders.Message_Sorts.To_Holder
               (AMF.UML.Asynch_Call);

         elsif Image = Asynch_Signal_Image then
            return
              AMF.UML.Holders.Message_Sorts.To_Holder
               (AMF.UML.Asynch_Signal);

         elsif Image = Create_Message_Image then
            return
              AMF.UML.Holders.Message_Sorts.To_Holder
               (AMF.UML.Create_Message);

         elsif Image = Delete_Message_Image then
            return
              AMF.UML.Holders.Message_Sorts.To_Holder
               (AMF.UML.Delete_Message);

         elsif Image = Reply_Image then
            return
              AMF.UML.Holders.Message_Sorts.To_Holder
               (AMF.UML.Reply);

         else
            raise Constraint_Error;
         end if;

      elsif DT = AMF.Internals.Tables.UML_Metamodel.MC_UML_Object_Node_Ordering_Kind then
         if Image = Unordered_Image then
            return
              AMF.UML.Holders.Object_Node_Ordering_Kinds.To_Holder
               (AMF.UML.Unordered);

         elsif Image = Ordered_Image then
            return
              AMF.UML.Holders.Object_Node_Ordering_Kinds.To_Holder
               (AMF.UML.Ordered);

         elsif Image = LIFO_Image then
            return
              AMF.UML.Holders.Object_Node_Ordering_Kinds.To_Holder
               (AMF.UML.LIFO);

         elsif Image = FIFO_Image then
            return
              AMF.UML.Holders.Object_Node_Ordering_Kinds.To_Holder
               (AMF.UML.FIFO);

         else
            raise Constraint_Error;
         end if;

      elsif DT = AMF.Internals.Tables.UML_Metamodel.MC_UML_Parameter_Direction_Kind then
         if Image = In_Image then
            return
              AMF.UML.Holders.Parameter_Direction_Kinds.To_Holder
               (AMF.UML.In_Parameter);

         elsif Image = Inout_Image then
            return
              AMF.UML.Holders.Parameter_Direction_Kinds.To_Holder
               (AMF.UML.In_Out_Parameter);

         elsif Image = Out_Image then
            return
              AMF.UML.Holders.Parameter_Direction_Kinds.To_Holder
               (AMF.UML.Out_Parameter);

         elsif Image = Return_Image then
            return
              AMF.UML.Holders.Parameter_Direction_Kinds.To_Holder
               (AMF.UML.Return_Parameter);

         else
            raise Constraint_Error;
         end if;

      elsif DT = AMF.Internals.Tables.UML_Metamodel.MC_UML_Parameter_Effect_Kind then
         if Image = Create_Image then
            return
              AMF.UML.Holders.Parameter_Effect_Kinds.To_Holder
               (AMF.UML.Create);

         elsif Image = Read_Image then
            return
              AMF.UML.Holders.Parameter_Effect_Kinds.To_Holder
               (AMF.UML.Read);

         elsif Image = Update_Image then
            return
              AMF.UML.Holders.Parameter_Effect_Kinds.To_Holder
               (AMF.UML.Update);

         elsif Image = Delete_Image then
            return
              AMF.UML.Holders.Parameter_Effect_Kinds.To_Holder
               (AMF.UML.Delete);

         else
            raise Constraint_Error;
         end if;

      elsif DT = AMF.Internals.Tables.UML_Metamodel.MC_UML_Pseudostate_Kind then
         if Image = Initial_Image then
            return
              AMF.UML.Holders.Pseudostate_Kinds.To_Holder
               (AMF.UML.Initial_Pseudostate);

         elsif Image = Deep_History_Image then
            return
              AMF.UML.Holders.Pseudostate_Kinds.To_Holder
               (AMF.UML.Deep_History_Pseudostate);

         elsif Image = Shallow_History_Image then
            return
              AMF.UML.Holders.Pseudostate_Kinds.To_Holder
               (AMF.UML.Shallow_History_Pseudostate);

         elsif Image = Join_Image then
            return
              AMF.UML.Holders.Pseudostate_Kinds.To_Holder
               (AMF.UML.Join_Pseudostate);

         elsif Image = Fork_Image then
            return
              AMF.UML.Holders.Pseudostate_Kinds.To_Holder
               (AMF.UML.Fork_Pseudostate);

         elsif Image = Junction_Image then
            return
              AMF.UML.Holders.Pseudostate_Kinds.To_Holder
               (AMF.UML.Junction_Pseudostate);

         elsif Image = Choice_Image then
            return
              AMF.UML.Holders.Pseudostate_Kinds.To_Holder
               (AMF.UML.Choice_Pseudostate);

         elsif Image = Entry_Point_Image then
            return
              AMF.UML.Holders.Pseudostate_Kinds.To_Holder
               (AMF.UML.Entry_Point_Pseudostate);

         elsif Image = Exit_Point_Image then
            return
              AMF.UML.Holders.Pseudostate_Kinds.To_Holder
               (AMF.UML.Exit_Point_Pseudostate);

         elsif Image = Terminate_Image then
            return
              AMF.UML.Holders.Pseudostate_Kinds.To_Holder
               (AMF.UML.Terminate_Pseudostate);

         else
            raise Constraint_Error;
         end if;

      elsif DT = AMF.Internals.Tables.UML_Metamodel.MC_UML_Transition_Kind then
         if Image = Internal_Image then
            return
              AMF.UML.Holders.Transition_Kinds.To_Holder
               (AMF.UML.Internal);

         elsif Image = Local_Image then
            return
              AMF.UML.Holders.Transition_Kinds.To_Holder
               (AMF.UML.Local);

         elsif Image = External_Image then
            return
              AMF.UML.Holders.Transition_Kinds.To_Holder
               (AMF.UML.External);

         else
            raise Constraint_Error;
         end if;

      elsif DT = AMF.Internals.Tables.UML_Metamodel.MC_UML_Visibility_Kind then
         if Image = Public_Image then
            return
              AMF.UML.Holders.Visibility_Kinds.To_Holder
               (AMF.UML.Public_Visibility);

         elsif Image = Private_Image then
            return
              AMF.UML.Holders.Visibility_Kinds.To_Holder
               (AMF.UML.Private_Visibility);

         elsif Image = Protected_Image then
            return
              AMF.UML.Holders.Visibility_Kinds.To_Holder
               (AMF.UML.Protected_Visibility);

         elsif Image = Package_Image then
            return
              AMF.UML.Holders.Visibility_Kinds.To_Holder
               (AMF.UML.Package_Visibility);

         else
            raise Constraint_Error;
         end if;

      else
         raise Program_Error;
      end if;
   end Create_From_String;

   -----------------
   -- Get_Package --
   -----------------

   overriding function Get_Package
    (Self : not null access constant UML_Factory)
       return not null AMF.CMOF.Packages.CMOF_Package_Access
   is
      pragma Unreferenced (Self);

   begin
      return
        AMF.CMOF.Packages.CMOF_Package_Access
         (AMF.Internals.Helpers.To_Element
           (AMF.Internals.Tables.UML_Metamodel.MM_UML_UML));
   end Get_Package;

end AMF.Internals.Factories.UML_Factories;