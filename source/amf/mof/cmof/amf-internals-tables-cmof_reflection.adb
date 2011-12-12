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
-- Copyright © 2010-2011, Vadim Godunko <vgodunko@gmail.com>                --
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
with AMF.CMOF.Associations;
with AMF.CMOF.Classes.Collections;
with AMF.CMOF.Classifiers.Collections;
with AMF.CMOF.Comments.Collections;
with AMF.CMOF.Constraints.Collections;
with AMF.CMOF.Data_Types;
with AMF.CMOF.Element_Imports.Collections;
with AMF.CMOF.Elements.Collections;
with AMF.CMOF.Enumeration_Literals.Collections;
with AMF.CMOF.Enumerations;
with AMF.CMOF.Expressions;
with AMF.CMOF.Features.Collections;
with AMF.CMOF.Named_Elements.Collections;
with AMF.CMOF.Namespaces;
with AMF.CMOF.Opaque_Expressions;
with AMF.CMOF.Operations.Collections;
with AMF.CMOF.Package_Imports.Collections;
with AMF.CMOF.Package_Merges.Collections;
with AMF.CMOF.Packageable_Elements.Collections;
with AMF.CMOF.Packages.Collections;
with AMF.CMOF.Parameters.Collections;
with AMF.CMOF.Primitive_Types;
with AMF.CMOF.Properties.Collections;
with AMF.CMOF.Redefinable_Elements.Collections;
with AMF.CMOF.Tags;
with AMF.CMOF.Types.Collections;
with AMF.CMOF.Value_Specifications.Collections;
with AMF.Internals.Holders.CMOF_Holders;
with AMF.String_Collections;
with AMF.CMOF.Holders.Parameter_Direction_Kinds;
with AMF.CMOF.Holders.Visibility_Kinds;
with AMF.Elements;
with AMF.Holders.Elements;
with AMF.Internals.CMOF_Elements;
with AMF.Internals.Helpers;
with AMF.Internals.Holders;
with AMF.Internals.Holders.CMOF_Holders;
with AMF.Internals.Tables.CMOF_Metamodel;
with AMF.Internals.Tables.CMOF_Element_Table;
with AMF.Internals.Tables.CMOF_Types;
with AMF.String_Collections.Internals;
with League.Holders.Booleans;

package body AMF.Internals.Tables.CMOF_Reflection is

   use AMF.Internals.Tables;
   use AMF.Internals.Tables.CMOF_Metamodel;
   use AMF.Internals.Tables.CMOF_Types;
   use type AMF.Internals.AMF_Element;

   ---------
   -- Get --
   ---------

   function Get
    (Self     : CMOF_Element;
     Property : CMOF_Element) return League.Holders.Holder
   is

      function Association_Get return League.Holders.Holder;
      --  Returns attribute's value of instance of Association class.

      function Class_Get return League.Holders.Holder;
      --  Returns attribute's value of instance of Class class.

      function Comment_Get return League.Holders.Holder;
      --  Returns attribute's value of instance of Comment class.

      function Constraint_Get return League.Holders.Holder;
      --  Returns attribute's value of instance of Constraint class.

      function Data_Type_Get return League.Holders.Holder;
      --  Returns attribute's value of instance of DataType class.

      function Element_Import_Get return League.Holders.Holder;
      --  Returns attribute's value of instance of ElementImport class.

      function Enumeration_Get return League.Holders.Holder;
      --  Returns attribute's value of instance of Enumeration class.

      function Enumeration_Literal_Get return League.Holders.Holder;
      --  Returns attribute's value of instance of EnumerationLiteral class.

      function Expression_Get return League.Holders.Holder;
      --  Returns attribute's value of instance of Expression class.

      function Opaque_Expression_Get return League.Holders.Holder;
      --  Returns attribute's value of instance of OpaqueExpression class.

      function Operation_Get return League.Holders.Holder;
      --  Returns attribute's value of instance of Operation class.

      function Package_Get return League.Holders.Holder;
      --  Returns attribute's value of instance of Package class.

      function Package_Import_Get return League.Holders.Holder;
      --  Returns attribute's value of instance of PackageImport class.

      function Package_Merge_Get return League.Holders.Holder;
      --  Returns attribute's value of instance of PackageMerge class.

      function Parameter_Get return League.Holders.Holder;
      --  Returns attribute's value of instance of Parameter class.

      function Primitive_Type_Get return League.Holders.Holder;
      --  Returns attribute's value of instance of PrimitiveType class.

      function Property_Get return League.Holders.Holder;
      --  Returns attribute's value of instance of Property class.

      function Tag_Get return League.Holders.Holder;
      --  Returns attribute's value of instance of Tag class.

      ---------------------
      -- Association_Get --
      ---------------------

      function Association_Get return League.Holders.Holder is
      begin
         if Property = MP_CMOF_Classifier_Attribute then
            --  Classifier::attribute : Property

            return
              AMF.CMOF.Properties.Collections.CMOF_Property_Collections.Internals.To_Holder
               (AMF.CMOF.Associations.CMOF_Association_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Attribute);

         elsif Property = MP_CMOF_Namespace_Element_Import then
            --  Namespace::elementImport : ElementImport

            return
              AMF.CMOF.Element_Imports.Collections.CMOF_Element_Import_Collections.Internals.To_Holder
               (AMF.CMOF.Associations.CMOF_Association_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Element_Import);

         elsif Property = MP_CMOF_Association_End_Type then
            --  Association::endType : Type

            return
              AMF.CMOF.Types.Collections.CMOF_Type_Collections.Internals.To_Holder
               (AMF.CMOF.Associations.CMOF_Association_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_End_Type);

         elsif Property = MP_CMOF_Classifier_Feature then
            --  Classifier::feature : Feature

            return
              AMF.CMOF.Features.Collections.CMOF_Feature_Collections.Internals.To_Holder
               (AMF.CMOF.Associations.CMOF_Association_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Feature);

         elsif Property = MP_CMOF_Classifier_General then
            --  Classifier::general : Classifier

            return
              AMF.CMOF.Classifiers.Collections.CMOF_Classifier_Collections.Internals.To_Holder
               (AMF.CMOF.Associations.CMOF_Association_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_General);

         elsif Property = MP_CMOF_Namespace_Imported_Member then
            --  Namespace::importedMember : PackageableElement

            return
              AMF.CMOF.Packageable_Elements.Collections.CMOF_Packageable_Element_Collections.Internals.To_Holder
               (AMF.CMOF.Associations.CMOF_Association_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Imported_Member);

         elsif Property = MP_CMOF_Classifier_Inherited_Member then
            --  Classifier::inheritedMember : NamedElement

            return
              AMF.CMOF.Named_Elements.Collections.CMOF_Named_Element_Collections.Internals.To_Holder
               (AMF.CMOF.Associations.CMOF_Association_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Inherited_Member);

         elsif Property = MP_CMOF_Association_Is_Derived then
            --  Association::isDerived : Boolean

            return
              League.Holders.Booleans.To_Holder
               (AMF.CMOF.Associations.CMOF_Association_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Is_Derived);

         elsif Property = MP_CMOF_Classifier_Is_Final_Specialization then
            --  Classifier::isFinalSpecialization : Boolean

            return
              League.Holders.Booleans.To_Holder
               (AMF.CMOF.Associations.CMOF_Association_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Is_Final_Specialization);

         elsif Property = MP_CMOF_Namespace_Member then
            --  Namespace::member : NamedElement

            return
              AMF.CMOF.Named_Elements.Collections.CMOF_Named_Element_Collections.Internals.To_Holder
               (AMF.CMOF.Associations.CMOF_Association_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Member);

         elsif Property = MP_CMOF_Association_Member_End then
            --  Association::memberEnd : Property

            return
              AMF.CMOF.Properties.Collections.CMOF_Property_Collections.Internals.To_Holder
               (AMF.CMOF.Associations.CMOF_Association_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Member_End);

         elsif Property = MP_CMOF_Named_Element_Name then
            --  NamedElement::name : String

            return
              AMF.Holders.To_Holder
               (AMF.CMOF.Associations.CMOF_Association_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Name);

         elsif Property = MP_CMOF_Named_Element_Namespace then
            --  NamedElement::namespace : Namespace

            return
              AMF.Internals.Holders.CMOF_Holders.To_Holder
               (AMF.CMOF.Namespaces.CMOF_Namespace_Access'
                 (AMF.CMOF.Associations.CMOF_Association_Access
                   (AMF.Internals.Helpers.To_Element (Self)).Get_Namespace));

         elsif Property = MP_CMOF_Association_Navigable_Owned_End then
            --  Association::navigableOwnedEnd : Property

            return
              AMF.CMOF.Properties.Collections.CMOF_Property_Collections.Internals.To_Holder
               (AMF.CMOF.Associations.CMOF_Association_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Navigable_Owned_End);

         elsif Property = MP_CMOF_Element_Owned_Comment then
            --  Element::ownedComment : Comment

            return
              AMF.CMOF.Comments.Collections.CMOF_Comment_Collections.Internals.To_Holder
               (AMF.CMOF.Associations.CMOF_Association_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Owned_Comment);

         elsif Property = MP_CMOF_Element_Owned_Element then
            --  Element::ownedElement : Element

            return
              AMF.CMOF.Elements.Collections.CMOF_Element_Collections.Internals.To_Holder
               (AMF.CMOF.Associations.CMOF_Association_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Owned_Element);

         elsif Property = MP_CMOF_Association_Owned_End then
            --  Association::ownedEnd : Property

            return
              AMF.CMOF.Properties.Collections.CMOF_Property_Collections.Internals.To_Holder
               (AMF.CMOF.Associations.CMOF_Association_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Owned_End);

         elsif Property = MP_CMOF_Namespace_Owned_Member then
            --  Namespace::ownedMember : NamedElement

            return
              AMF.CMOF.Named_Elements.Collections.CMOF_Named_Element_Collections.Internals.To_Holder
               (AMF.CMOF.Associations.CMOF_Association_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Owned_Member);

         elsif Property = MP_CMOF_Namespace_Owned_Rule then
            --  Namespace::ownedRule : Constraint

            return
              AMF.CMOF.Constraints.Collections.CMOF_Constraint_Collections.Internals.To_Holder
               (AMF.CMOF.Associations.CMOF_Association_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Owned_Rule);

         elsif Property = MP_CMOF_Element_Owner then
            --  Element::owner : Element

            return
              AMF.Internals.Holders.CMOF_Holders.To_Holder
               (AMF.CMOF.Elements.CMOF_Element_Access'
                 (AMF.CMOF.Associations.CMOF_Association_Access
                   (AMF.Internals.Helpers.To_Element (Self)).Get_Owner));

         elsif Property = MP_CMOF_Type_Package then
            --  Type::package : Package

            return
              AMF.Internals.Holders.CMOF_Holders.To_Holder
               (AMF.CMOF.Packages.CMOF_Package_Access'
                 (AMF.CMOF.Associations.CMOF_Association_Access
                   (AMF.Internals.Helpers.To_Element (Self)).Get_Package));

         elsif Property = MP_CMOF_Namespace_Package_Import then
            --  Namespace::packageImport : PackageImport

            return
              AMF.CMOF.Package_Imports.Collections.CMOF_Package_Import_Collections.Internals.To_Holder
               (AMF.CMOF.Associations.CMOF_Association_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Package_Import);

         elsif Property = MP_CMOF_Named_Element_Qualified_Name then
            --  NamedElement::qualifiedName : String

            return
              AMF.Holders.To_Holder
               (AMF.CMOF.Associations.CMOF_Association_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Qualified_Name);

         elsif Property = MP_CMOF_Relationship_Related_Element then
            --  Relationship::relatedElement : Element

            return
              AMF.CMOF.Elements.Collections.CMOF_Element_Collections.Internals.To_Holder
               (AMF.CMOF.Associations.CMOF_Association_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Related_Element);

         elsif Property = MP_CMOF_Named_Element_Visibility then
            --  NamedElement::visibility : VisibilityKind

            return
              AMF.CMOF.Holders.To_Holder
               (AMF.CMOF.Associations.CMOF_Association_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Visibility);

         else
            raise Program_Error;
         end if;
      end Association_Get;

      ---------------
      -- Class_Get --
      ---------------

      function Class_Get return League.Holders.Holder is
      begin
         if Property = MP_CMOF_Classifier_Attribute then
            --  Classifier::attribute : Property

            return
              AMF.CMOF.Properties.Collections.CMOF_Property_Collections.Internals.To_Holder
               (AMF.CMOF.Classes.CMOF_Class_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Attribute);

         elsif Property = MP_CMOF_Namespace_Element_Import then
            --  Namespace::elementImport : ElementImport

            return
              AMF.CMOF.Element_Imports.Collections.CMOF_Element_Import_Collections.Internals.To_Holder
               (AMF.CMOF.Classes.CMOF_Class_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Element_Import);

         elsif Property = MP_CMOF_Classifier_Feature then
            --  Classifier::feature : Feature

            return
              AMF.CMOF.Features.Collections.CMOF_Feature_Collections.Internals.To_Holder
               (AMF.CMOF.Classes.CMOF_Class_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Feature);

         elsif Property = MP_CMOF_Classifier_General then
            --  Classifier::general : Classifier

            return
              AMF.CMOF.Classifiers.Collections.CMOF_Classifier_Collections.Internals.To_Holder
               (AMF.CMOF.Classes.CMOF_Class_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_General);

         elsif Property = MP_CMOF_Namespace_Imported_Member then
            --  Namespace::importedMember : PackageableElement

            return
              AMF.CMOF.Packageable_Elements.Collections.CMOF_Packageable_Element_Collections.Internals.To_Holder
               (AMF.CMOF.Classes.CMOF_Class_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Imported_Member);

         elsif Property = MP_CMOF_Classifier_Inherited_Member then
            --  Classifier::inheritedMember : NamedElement

            return
              AMF.CMOF.Named_Elements.Collections.CMOF_Named_Element_Collections.Internals.To_Holder
               (AMF.CMOF.Classes.CMOF_Class_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Inherited_Member);

         elsif Property = MP_CMOF_Class_Is_Abstract then
            --  Class::isAbstract : Boolean

            return
              League.Holders.Booleans.To_Holder
               (AMF.CMOF.Classes.CMOF_Class_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Is_Abstract);

         elsif Property = MP_CMOF_Classifier_Is_Final_Specialization then
            --  Classifier::isFinalSpecialization : Boolean

            return
              League.Holders.Booleans.To_Holder
               (AMF.CMOF.Classes.CMOF_Class_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Is_Final_Specialization);

         elsif Property = MP_CMOF_Namespace_Member then
            --  Namespace::member : NamedElement

            return
              AMF.CMOF.Named_Elements.Collections.CMOF_Named_Element_Collections.Internals.To_Holder
               (AMF.CMOF.Classes.CMOF_Class_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Member);

         elsif Property = MP_CMOF_Named_Element_Name then
            --  NamedElement::name : String

            return
              AMF.Holders.To_Holder
               (AMF.CMOF.Classes.CMOF_Class_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Name);

         elsif Property = MP_CMOF_Named_Element_Namespace then
            --  NamedElement::namespace : Namespace

            return
              AMF.Internals.Holders.CMOF_Holders.To_Holder
               (AMF.CMOF.Namespaces.CMOF_Namespace_Access'
                 (AMF.CMOF.Classes.CMOF_Class_Access
                   (AMF.Internals.Helpers.To_Element (Self)).Get_Namespace));

         elsif Property = MP_CMOF_Class_Owned_Attribute then
            --  Class::ownedAttribute : Property

            return
              AMF.CMOF.Properties.Collections.CMOF_Property_Collections.Internals.To_Holder
               (AMF.CMOF.Classes.CMOF_Class_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Owned_Attribute);

         elsif Property = MP_CMOF_Element_Owned_Comment then
            --  Element::ownedComment : Comment

            return
              AMF.CMOF.Comments.Collections.CMOF_Comment_Collections.Internals.To_Holder
               (AMF.CMOF.Classes.CMOF_Class_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Owned_Comment);

         elsif Property = MP_CMOF_Element_Owned_Element then
            --  Element::ownedElement : Element

            return
              AMF.CMOF.Elements.Collections.CMOF_Element_Collections.Internals.To_Holder
               (AMF.CMOF.Classes.CMOF_Class_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Owned_Element);

         elsif Property = MP_CMOF_Namespace_Owned_Member then
            --  Namespace::ownedMember : NamedElement

            return
              AMF.CMOF.Named_Elements.Collections.CMOF_Named_Element_Collections.Internals.To_Holder
               (AMF.CMOF.Classes.CMOF_Class_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Owned_Member);

         elsif Property = MP_CMOF_Class_Owned_Operation then
            --  Class::ownedOperation : Operation

            return
              AMF.CMOF.Operations.Collections.CMOF_Operation_Collections.Internals.To_Holder
               (AMF.CMOF.Classes.CMOF_Class_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Owned_Operation);

         elsif Property = MP_CMOF_Namespace_Owned_Rule then
            --  Namespace::ownedRule : Constraint

            return
              AMF.CMOF.Constraints.Collections.CMOF_Constraint_Collections.Internals.To_Holder
               (AMF.CMOF.Classes.CMOF_Class_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Owned_Rule);

         elsif Property = MP_CMOF_Element_Owner then
            --  Element::owner : Element

            return
              AMF.Internals.Holders.CMOF_Holders.To_Holder
               (AMF.CMOF.Elements.CMOF_Element_Access'
                 (AMF.CMOF.Classes.CMOF_Class_Access
                   (AMF.Internals.Helpers.To_Element (Self)).Get_Owner));

         elsif Property = MP_CMOF_Type_Package then
            --  Type::package : Package

            return
              AMF.Internals.Holders.CMOF_Holders.To_Holder
               (AMF.CMOF.Packages.CMOF_Package_Access'
                 (AMF.CMOF.Classes.CMOF_Class_Access
                   (AMF.Internals.Helpers.To_Element (Self)).Get_Package));

         elsif Property = MP_CMOF_Namespace_Package_Import then
            --  Namespace::packageImport : PackageImport

            return
              AMF.CMOF.Package_Imports.Collections.CMOF_Package_Import_Collections.Internals.To_Holder
               (AMF.CMOF.Classes.CMOF_Class_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Package_Import);

         elsif Property = MP_CMOF_Named_Element_Qualified_Name then
            --  NamedElement::qualifiedName : String

            return
              AMF.Holders.To_Holder
               (AMF.CMOF.Classes.CMOF_Class_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Qualified_Name);

         elsif Property = MP_CMOF_Class_Super_Class then
            --  Class::superClass : Class

            return
              AMF.CMOF.Classes.Collections.CMOF_Class_Collections.Internals.To_Holder
               (AMF.CMOF.Classes.CMOF_Class_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Super_Class);

         elsif Property = MP_CMOF_Named_Element_Visibility then
            --  NamedElement::visibility : VisibilityKind

            return
              AMF.CMOF.Holders.To_Holder
               (AMF.CMOF.Classes.CMOF_Class_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Visibility);

         else
            raise Program_Error;
         end if;
      end Class_Get;

      -----------------
      -- Comment_Get --
      -----------------

      function Comment_Get return League.Holders.Holder is
      begin
         if Property = MP_CMOF_Comment_Annotated_Element then
            --  Comment::annotatedElement : Element

            return
              AMF.CMOF.Elements.Collections.CMOF_Element_Collections.Internals.To_Holder
               (AMF.CMOF.Comments.CMOF_Comment_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Annotated_Element);

         elsif Property = MP_CMOF_Comment_Body then
            --  Comment::body : String

            return
              AMF.Holders.To_Holder
               (AMF.CMOF.Comments.CMOF_Comment_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Body);

         elsif Property = MP_CMOF_Element_Owned_Comment then
            --  Element::ownedComment : Comment

            return
              AMF.CMOF.Comments.Collections.CMOF_Comment_Collections.Internals.To_Holder
               (AMF.CMOF.Comments.CMOF_Comment_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Owned_Comment);

         elsif Property = MP_CMOF_Element_Owned_Element then
            --  Element::ownedElement : Element

            return
              AMF.CMOF.Elements.Collections.CMOF_Element_Collections.Internals.To_Holder
               (AMF.CMOF.Comments.CMOF_Comment_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Owned_Element);

         elsif Property = MP_CMOF_Element_Owner then
            --  Element::owner : Element

            return
              AMF.Internals.Holders.CMOF_Holders.To_Holder
               (AMF.CMOF.Elements.CMOF_Element_Access'
                 (AMF.CMOF.Comments.CMOF_Comment_Access
                   (AMF.Internals.Helpers.To_Element (Self)).Get_Owner));

         else
            raise Program_Error;
         end if;
      end Comment_Get;

      --------------------
      -- Constraint_Get --
      --------------------

      function Constraint_Get return League.Holders.Holder is
      begin
         if Property = MP_CMOF_Constraint_Constrained_Element then
            --  Constraint::constrainedElement : Element

            return
              AMF.CMOF.Elements.Collections.CMOF_Element_Collections.Internals.To_Holder
               (AMF.CMOF.Constraints.CMOF_Constraint_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Constrained_Element);

         elsif Property = MP_CMOF_Constraint_Context then
            --  Constraint::context : Namespace

            return
              AMF.Internals.Holders.CMOF_Holders.To_Holder
               (AMF.CMOF.Namespaces.CMOF_Namespace_Access'
                 (AMF.CMOF.Constraints.CMOF_Constraint_Access
                   (AMF.Internals.Helpers.To_Element (Self)).Get_Context));

         elsif Property = MP_CMOF_Named_Element_Name then
            --  NamedElement::name : String

            return
              AMF.Holders.To_Holder
               (AMF.CMOF.Constraints.CMOF_Constraint_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Name);

         elsif Property = MP_CMOF_Named_Element_Namespace then
            --  NamedElement::namespace : Namespace

            return
              AMF.Internals.Holders.CMOF_Holders.To_Holder
               (AMF.CMOF.Namespaces.CMOF_Namespace_Access'
                 (AMF.CMOF.Constraints.CMOF_Constraint_Access
                   (AMF.Internals.Helpers.To_Element (Self)).Get_Namespace));

         elsif Property = MP_CMOF_Element_Owned_Comment then
            --  Element::ownedComment : Comment

            return
              AMF.CMOF.Comments.Collections.CMOF_Comment_Collections.Internals.To_Holder
               (AMF.CMOF.Constraints.CMOF_Constraint_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Owned_Comment);

         elsif Property = MP_CMOF_Element_Owned_Element then
            --  Element::ownedElement : Element

            return
              AMF.CMOF.Elements.Collections.CMOF_Element_Collections.Internals.To_Holder
               (AMF.CMOF.Constraints.CMOF_Constraint_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Owned_Element);

         elsif Property = MP_CMOF_Element_Owner then
            --  Element::owner : Element

            return
              AMF.Internals.Holders.CMOF_Holders.To_Holder
               (AMF.CMOF.Elements.CMOF_Element_Access'
                 (AMF.CMOF.Constraints.CMOF_Constraint_Access
                   (AMF.Internals.Helpers.To_Element (Self)).Get_Owner));

         elsif Property = MP_CMOF_Named_Element_Qualified_Name then
            --  NamedElement::qualifiedName : String

            return
              AMF.Holders.To_Holder
               (AMF.CMOF.Constraints.CMOF_Constraint_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Qualified_Name);

         elsif Property = MP_CMOF_Constraint_Specification then
            --  Constraint::specification : ValueSpecification

            return
              AMF.Internals.Holders.CMOF_Holders.To_Holder
               (AMF.CMOF.Value_Specifications.CMOF_Value_Specification_Access'
                 (AMF.CMOF.Constraints.CMOF_Constraint_Access
                   (AMF.Internals.Helpers.To_Element (Self)).Get_Specification));

         elsif Property = MP_CMOF_Named_Element_Visibility then
            --  NamedElement::visibility : VisibilityKind

            return
              AMF.CMOF.Holders.To_Holder
               (AMF.CMOF.Constraints.CMOF_Constraint_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Visibility);

         else
            raise Program_Error;
         end if;
      end Constraint_Get;

      -------------------
      -- Data_Type_Get --
      -------------------

      function Data_Type_Get return League.Holders.Holder is
      begin
         if Property = MP_CMOF_Classifier_Attribute then
            --  Classifier::attribute : Property

            return
              AMF.CMOF.Properties.Collections.CMOF_Property_Collections.Internals.To_Holder
               (AMF.CMOF.Data_Types.CMOF_Data_Type_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Attribute);

         elsif Property = MP_CMOF_Namespace_Element_Import then
            --  Namespace::elementImport : ElementImport

            return
              AMF.CMOF.Element_Imports.Collections.CMOF_Element_Import_Collections.Internals.To_Holder
               (AMF.CMOF.Data_Types.CMOF_Data_Type_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Element_Import);

         elsif Property = MP_CMOF_Classifier_Feature then
            --  Classifier::feature : Feature

            return
              AMF.CMOF.Features.Collections.CMOF_Feature_Collections.Internals.To_Holder
               (AMF.CMOF.Data_Types.CMOF_Data_Type_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Feature);

         elsif Property = MP_CMOF_Classifier_General then
            --  Classifier::general : Classifier

            return
              AMF.CMOF.Classifiers.Collections.CMOF_Classifier_Collections.Internals.To_Holder
               (AMF.CMOF.Data_Types.CMOF_Data_Type_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_General);

         elsif Property = MP_CMOF_Namespace_Imported_Member then
            --  Namespace::importedMember : PackageableElement

            return
              AMF.CMOF.Packageable_Elements.Collections.CMOF_Packageable_Element_Collections.Internals.To_Holder
               (AMF.CMOF.Data_Types.CMOF_Data_Type_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Imported_Member);

         elsif Property = MP_CMOF_Classifier_Inherited_Member then
            --  Classifier::inheritedMember : NamedElement

            return
              AMF.CMOF.Named_Elements.Collections.CMOF_Named_Element_Collections.Internals.To_Holder
               (AMF.CMOF.Data_Types.CMOF_Data_Type_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Inherited_Member);

         elsif Property = MP_CMOF_Classifier_Is_Final_Specialization then
            --  Classifier::isFinalSpecialization : Boolean

            return
              League.Holders.Booleans.To_Holder
               (AMF.CMOF.Data_Types.CMOF_Data_Type_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Is_Final_Specialization);

         elsif Property = MP_CMOF_Namespace_Member then
            --  Namespace::member : NamedElement

            return
              AMF.CMOF.Named_Elements.Collections.CMOF_Named_Element_Collections.Internals.To_Holder
               (AMF.CMOF.Data_Types.CMOF_Data_Type_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Member);

         elsif Property = MP_CMOF_Named_Element_Name then
            --  NamedElement::name : String

            return
              AMF.Holders.To_Holder
               (AMF.CMOF.Data_Types.CMOF_Data_Type_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Name);

         elsif Property = MP_CMOF_Named_Element_Namespace then
            --  NamedElement::namespace : Namespace

            return
              AMF.Internals.Holders.CMOF_Holders.To_Holder
               (AMF.CMOF.Namespaces.CMOF_Namespace_Access'
                 (AMF.CMOF.Data_Types.CMOF_Data_Type_Access
                   (AMF.Internals.Helpers.To_Element (Self)).Get_Namespace));

         elsif Property = MP_CMOF_Data_Type_Owned_Attribute then
            --  DataType::ownedAttribute : Property

            return
              AMF.CMOF.Properties.Collections.CMOF_Property_Collections.Internals.To_Holder
               (AMF.CMOF.Data_Types.CMOF_Data_Type_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Owned_Attribute);

         elsif Property = MP_CMOF_Element_Owned_Comment then
            --  Element::ownedComment : Comment

            return
              AMF.CMOF.Comments.Collections.CMOF_Comment_Collections.Internals.To_Holder
               (AMF.CMOF.Data_Types.CMOF_Data_Type_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Owned_Comment);

         elsif Property = MP_CMOF_Element_Owned_Element then
            --  Element::ownedElement : Element

            return
              AMF.CMOF.Elements.Collections.CMOF_Element_Collections.Internals.To_Holder
               (AMF.CMOF.Data_Types.CMOF_Data_Type_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Owned_Element);

         elsif Property = MP_CMOF_Namespace_Owned_Member then
            --  Namespace::ownedMember : NamedElement

            return
              AMF.CMOF.Named_Elements.Collections.CMOF_Named_Element_Collections.Internals.To_Holder
               (AMF.CMOF.Data_Types.CMOF_Data_Type_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Owned_Member);

         elsif Property = MP_CMOF_Data_Type_Owned_Operation then
            --  DataType::ownedOperation : Operation

            return
              AMF.CMOF.Operations.Collections.CMOF_Operation_Collections.Internals.To_Holder
               (AMF.CMOF.Data_Types.CMOF_Data_Type_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Owned_Operation);

         elsif Property = MP_CMOF_Namespace_Owned_Rule then
            --  Namespace::ownedRule : Constraint

            return
              AMF.CMOF.Constraints.Collections.CMOF_Constraint_Collections.Internals.To_Holder
               (AMF.CMOF.Data_Types.CMOF_Data_Type_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Owned_Rule);

         elsif Property = MP_CMOF_Element_Owner then
            --  Element::owner : Element

            return
              AMF.Internals.Holders.CMOF_Holders.To_Holder
               (AMF.CMOF.Elements.CMOF_Element_Access'
                 (AMF.CMOF.Data_Types.CMOF_Data_Type_Access
                   (AMF.Internals.Helpers.To_Element (Self)).Get_Owner));

         elsif Property = MP_CMOF_Type_Package then
            --  Type::package : Package

            return
              AMF.Internals.Holders.CMOF_Holders.To_Holder
               (AMF.CMOF.Packages.CMOF_Package_Access'
                 (AMF.CMOF.Data_Types.CMOF_Data_Type_Access
                   (AMF.Internals.Helpers.To_Element (Self)).Get_Package));

         elsif Property = MP_CMOF_Namespace_Package_Import then
            --  Namespace::packageImport : PackageImport

            return
              AMF.CMOF.Package_Imports.Collections.CMOF_Package_Import_Collections.Internals.To_Holder
               (AMF.CMOF.Data_Types.CMOF_Data_Type_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Package_Import);

         elsif Property = MP_CMOF_Named_Element_Qualified_Name then
            --  NamedElement::qualifiedName : String

            return
              AMF.Holders.To_Holder
               (AMF.CMOF.Data_Types.CMOF_Data_Type_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Qualified_Name);

         elsif Property = MP_CMOF_Named_Element_Visibility then
            --  NamedElement::visibility : VisibilityKind

            return
              AMF.CMOF.Holders.To_Holder
               (AMF.CMOF.Data_Types.CMOF_Data_Type_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Visibility);

         else
            raise Program_Error;
         end if;
      end Data_Type_Get;

      ------------------------
      -- Element_Import_Get --
      ------------------------

      function Element_Import_Get return League.Holders.Holder is
      begin
         if Property = MP_CMOF_Element_Import_Alias then
            --  ElementImport::alias : String

            return
              AMF.Holders.To_Holder
               (AMF.CMOF.Element_Imports.CMOF_Element_Import_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Alias);

         elsif Property = MP_CMOF_Element_Import_Imported_Element then
            --  ElementImport::importedElement : PackageableElement

            return
              AMF.Internals.Holders.CMOF_Holders.To_Holder
               (AMF.CMOF.Packageable_Elements.CMOF_Packageable_Element_Access'
                 (AMF.CMOF.Element_Imports.CMOF_Element_Import_Access
                   (AMF.Internals.Helpers.To_Element (Self)).Get_Imported_Element));

         elsif Property = MP_CMOF_Element_Import_Importing_Namespace then
            --  ElementImport::importingNamespace : Namespace

            return
              AMF.Internals.Holders.CMOF_Holders.To_Holder
               (AMF.CMOF.Namespaces.CMOF_Namespace_Access'
                 (AMF.CMOF.Element_Imports.CMOF_Element_Import_Access
                   (AMF.Internals.Helpers.To_Element (Self)).Get_Importing_Namespace));

         elsif Property = MP_CMOF_Element_Owned_Comment then
            --  Element::ownedComment : Comment

            return
              AMF.CMOF.Comments.Collections.CMOF_Comment_Collections.Internals.To_Holder
               (AMF.CMOF.Element_Imports.CMOF_Element_Import_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Owned_Comment);

         elsif Property = MP_CMOF_Element_Owned_Element then
            --  Element::ownedElement : Element

            return
              AMF.CMOF.Elements.Collections.CMOF_Element_Collections.Internals.To_Holder
               (AMF.CMOF.Element_Imports.CMOF_Element_Import_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Owned_Element);

         elsif Property = MP_CMOF_Element_Owner then
            --  Element::owner : Element

            return
              AMF.Internals.Holders.CMOF_Holders.To_Holder
               (AMF.CMOF.Elements.CMOF_Element_Access'
                 (AMF.CMOF.Element_Imports.CMOF_Element_Import_Access
                   (AMF.Internals.Helpers.To_Element (Self)).Get_Owner));

         elsif Property = MP_CMOF_Relationship_Related_Element then
            --  Relationship::relatedElement : Element

            return
              AMF.CMOF.Elements.Collections.CMOF_Element_Collections.Internals.To_Holder
               (AMF.CMOF.Element_Imports.CMOF_Element_Import_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Related_Element);

         elsif Property = MP_CMOF_Directed_Relationship_Source then
            --  DirectedRelationship::source : Element

            return
              AMF.CMOF.Elements.Collections.CMOF_Element_Collections.Internals.To_Holder
               (AMF.CMOF.Element_Imports.CMOF_Element_Import_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Source);

         elsif Property = MP_CMOF_Directed_Relationship_Target then
            --  DirectedRelationship::target : Element

            return
              AMF.CMOF.Elements.Collections.CMOF_Element_Collections.Internals.To_Holder
               (AMF.CMOF.Element_Imports.CMOF_Element_Import_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Target);

         elsif Property = MP_CMOF_Element_Import_Visibility then
            --  ElementImport::visibility : VisibilityKind

            return
              AMF.CMOF.Holders.Visibility_Kinds.To_Holder
               (AMF.CMOF.Element_Imports.CMOF_Element_Import_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Visibility);

         else
            raise Program_Error;
         end if;
      end Element_Import_Get;

      ---------------------
      -- Enumeration_Get --
      ---------------------

      function Enumeration_Get return League.Holders.Holder is
      begin
         if Property = MP_CMOF_Classifier_Attribute then
            --  Classifier::attribute : Property

            return
              AMF.CMOF.Properties.Collections.CMOF_Property_Collections.Internals.To_Holder
               (AMF.CMOF.Enumerations.CMOF_Enumeration_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Attribute);

         elsif Property = MP_CMOF_Namespace_Element_Import then
            --  Namespace::elementImport : ElementImport

            return
              AMF.CMOF.Element_Imports.Collections.CMOF_Element_Import_Collections.Internals.To_Holder
               (AMF.CMOF.Enumerations.CMOF_Enumeration_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Element_Import);

         elsif Property = MP_CMOF_Classifier_Feature then
            --  Classifier::feature : Feature

            return
              AMF.CMOF.Features.Collections.CMOF_Feature_Collections.Internals.To_Holder
               (AMF.CMOF.Enumerations.CMOF_Enumeration_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Feature);

         elsif Property = MP_CMOF_Classifier_General then
            --  Classifier::general : Classifier

            return
              AMF.CMOF.Classifiers.Collections.CMOF_Classifier_Collections.Internals.To_Holder
               (AMF.CMOF.Enumerations.CMOF_Enumeration_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_General);

         elsif Property = MP_CMOF_Namespace_Imported_Member then
            --  Namespace::importedMember : PackageableElement

            return
              AMF.CMOF.Packageable_Elements.Collections.CMOF_Packageable_Element_Collections.Internals.To_Holder
               (AMF.CMOF.Enumerations.CMOF_Enumeration_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Imported_Member);

         elsif Property = MP_CMOF_Classifier_Inherited_Member then
            --  Classifier::inheritedMember : NamedElement

            return
              AMF.CMOF.Named_Elements.Collections.CMOF_Named_Element_Collections.Internals.To_Holder
               (AMF.CMOF.Enumerations.CMOF_Enumeration_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Inherited_Member);

         elsif Property = MP_CMOF_Classifier_Is_Final_Specialization then
            --  Classifier::isFinalSpecialization : Boolean

            return
              League.Holders.Booleans.To_Holder
               (AMF.CMOF.Enumerations.CMOF_Enumeration_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Is_Final_Specialization);

         elsif Property = MP_CMOF_Namespace_Member then
            --  Namespace::member : NamedElement

            return
              AMF.CMOF.Named_Elements.Collections.CMOF_Named_Element_Collections.Internals.To_Holder
               (AMF.CMOF.Enumerations.CMOF_Enumeration_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Member);

         elsif Property = MP_CMOF_Named_Element_Name then
            --  NamedElement::name : String

            return
              AMF.Holders.To_Holder
               (AMF.CMOF.Enumerations.CMOF_Enumeration_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Name);

         elsif Property = MP_CMOF_Named_Element_Namespace then
            --  NamedElement::namespace : Namespace

            return
              AMF.Internals.Holders.CMOF_Holders.To_Holder
               (AMF.CMOF.Namespaces.CMOF_Namespace_Access'
                 (AMF.CMOF.Enumerations.CMOF_Enumeration_Access
                   (AMF.Internals.Helpers.To_Element (Self)).Get_Namespace));

         elsif Property = MP_CMOF_Data_Type_Owned_Attribute then
            --  DataType::ownedAttribute : Property

            return
              AMF.CMOF.Properties.Collections.CMOF_Property_Collections.Internals.To_Holder
               (AMF.CMOF.Enumerations.CMOF_Enumeration_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Owned_Attribute);

         elsif Property = MP_CMOF_Element_Owned_Comment then
            --  Element::ownedComment : Comment

            return
              AMF.CMOF.Comments.Collections.CMOF_Comment_Collections.Internals.To_Holder
               (AMF.CMOF.Enumerations.CMOF_Enumeration_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Owned_Comment);

         elsif Property = MP_CMOF_Element_Owned_Element then
            --  Element::ownedElement : Element

            return
              AMF.CMOF.Elements.Collections.CMOF_Element_Collections.Internals.To_Holder
               (AMF.CMOF.Enumerations.CMOF_Enumeration_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Owned_Element);

         elsif Property = MP_CMOF_Enumeration_Owned_Literal then
            --  Enumeration::ownedLiteral : EnumerationLiteral

            return
              AMF.CMOF.Enumeration_Literals.Collections.CMOF_Enumeration_Literal_Collections.Internals.To_Holder
               (AMF.CMOF.Enumerations.CMOF_Enumeration_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Owned_Literal);

         elsif Property = MP_CMOF_Namespace_Owned_Member then
            --  Namespace::ownedMember : NamedElement

            return
              AMF.CMOF.Named_Elements.Collections.CMOF_Named_Element_Collections.Internals.To_Holder
               (AMF.CMOF.Enumerations.CMOF_Enumeration_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Owned_Member);

         elsif Property = MP_CMOF_Data_Type_Owned_Operation then
            --  DataType::ownedOperation : Operation

            return
              AMF.CMOF.Operations.Collections.CMOF_Operation_Collections.Internals.To_Holder
               (AMF.CMOF.Enumerations.CMOF_Enumeration_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Owned_Operation);

         elsif Property = MP_CMOF_Namespace_Owned_Rule then
            --  Namespace::ownedRule : Constraint

            return
              AMF.CMOF.Constraints.Collections.CMOF_Constraint_Collections.Internals.To_Holder
               (AMF.CMOF.Enumerations.CMOF_Enumeration_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Owned_Rule);

         elsif Property = MP_CMOF_Element_Owner then
            --  Element::owner : Element

            return
              AMF.Internals.Holders.CMOF_Holders.To_Holder
               (AMF.CMOF.Elements.CMOF_Element_Access'
                 (AMF.CMOF.Enumerations.CMOF_Enumeration_Access
                   (AMF.Internals.Helpers.To_Element (Self)).Get_Owner));

         elsif Property = MP_CMOF_Type_Package then
            --  Type::package : Package

            return
              AMF.Internals.Holders.CMOF_Holders.To_Holder
               (AMF.CMOF.Packages.CMOF_Package_Access'
                 (AMF.CMOF.Enumerations.CMOF_Enumeration_Access
                   (AMF.Internals.Helpers.To_Element (Self)).Get_Package));

         elsif Property = MP_CMOF_Namespace_Package_Import then
            --  Namespace::packageImport : PackageImport

            return
              AMF.CMOF.Package_Imports.Collections.CMOF_Package_Import_Collections.Internals.To_Holder
               (AMF.CMOF.Enumerations.CMOF_Enumeration_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Package_Import);

         elsif Property = MP_CMOF_Named_Element_Qualified_Name then
            --  NamedElement::qualifiedName : String

            return
              AMF.Holders.To_Holder
               (AMF.CMOF.Enumerations.CMOF_Enumeration_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Qualified_Name);

         elsif Property = MP_CMOF_Named_Element_Visibility then
            --  NamedElement::visibility : VisibilityKind

            return
              AMF.CMOF.Holders.To_Holder
               (AMF.CMOF.Enumerations.CMOF_Enumeration_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Visibility);

         else
            raise Program_Error;
         end if;
      end Enumeration_Get;

      -----------------------------
      -- Enumeration_Literal_Get --
      -----------------------------

      function Enumeration_Literal_Get return League.Holders.Holder is
      begin
         if Property = MP_CMOF_Enumeration_Literal_Enumeration then
            --  EnumerationLiteral::enumeration : Enumeration

            return
              AMF.Internals.Holders.CMOF_Holders.To_Holder
               (AMF.CMOF.Enumerations.CMOF_Enumeration_Access'
                 (AMF.CMOF.Enumeration_Literals.CMOF_Enumeration_Literal_Access
                   (AMF.Internals.Helpers.To_Element (Self)).Get_Enumeration));

         elsif Property = MP_CMOF_Named_Element_Name then
            --  NamedElement::name : String

            return
              AMF.Holders.To_Holder
               (AMF.CMOF.Enumeration_Literals.CMOF_Enumeration_Literal_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Name);

         elsif Property = MP_CMOF_Named_Element_Namespace then
            --  NamedElement::namespace : Namespace

            return
              AMF.Internals.Holders.CMOF_Holders.To_Holder
               (AMF.CMOF.Namespaces.CMOF_Namespace_Access'
                 (AMF.CMOF.Enumeration_Literals.CMOF_Enumeration_Literal_Access
                   (AMF.Internals.Helpers.To_Element (Self)).Get_Namespace));

         elsif Property = MP_CMOF_Element_Owned_Comment then
            --  Element::ownedComment : Comment

            return
              AMF.CMOF.Comments.Collections.CMOF_Comment_Collections.Internals.To_Holder
               (AMF.CMOF.Enumeration_Literals.CMOF_Enumeration_Literal_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Owned_Comment);

         elsif Property = MP_CMOF_Element_Owned_Element then
            --  Element::ownedElement : Element

            return
              AMF.CMOF.Elements.Collections.CMOF_Element_Collections.Internals.To_Holder
               (AMF.CMOF.Enumeration_Literals.CMOF_Enumeration_Literal_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Owned_Element);

         elsif Property = MP_CMOF_Element_Owner then
            --  Element::owner : Element

            return
              AMF.Internals.Holders.CMOF_Holders.To_Holder
               (AMF.CMOF.Elements.CMOF_Element_Access'
                 (AMF.CMOF.Enumeration_Literals.CMOF_Enumeration_Literal_Access
                   (AMF.Internals.Helpers.To_Element (Self)).Get_Owner));

         elsif Property = MP_CMOF_Named_Element_Qualified_Name then
            --  NamedElement::qualifiedName : String

            return
              AMF.Holders.To_Holder
               (AMF.CMOF.Enumeration_Literals.CMOF_Enumeration_Literal_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Qualified_Name);

         elsif Property = MP_CMOF_Named_Element_Visibility then
            --  NamedElement::visibility : VisibilityKind

            return
              AMF.CMOF.Holders.To_Holder
               (AMF.CMOF.Enumeration_Literals.CMOF_Enumeration_Literal_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Visibility);

         else
            raise Program_Error;
         end if;
      end Enumeration_Literal_Get;

      --------------------
      -- Expression_Get --
      --------------------

      function Expression_Get return League.Holders.Holder is
      begin
         if Property = MP_CMOF_Named_Element_Name then
            --  NamedElement::name : String

            return
              AMF.Holders.To_Holder
               (AMF.CMOF.Expressions.CMOF_Expression_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Name);

         elsif Property = MP_CMOF_Named_Element_Namespace then
            --  NamedElement::namespace : Namespace

            return
              AMF.Internals.Holders.CMOF_Holders.To_Holder
               (AMF.CMOF.Namespaces.CMOF_Namespace_Access'
                 (AMF.CMOF.Expressions.CMOF_Expression_Access
                   (AMF.Internals.Helpers.To_Element (Self)).Get_Namespace));

         elsif Property = MP_CMOF_Expression_Operand then
            --  Expression::operand : ValueSpecification

            return
              AMF.CMOF.Value_Specifications.Collections.CMOF_Value_Specification_Collections.Internals.To_Holder
               (AMF.CMOF.Expressions.CMOF_Expression_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Operand);

         elsif Property = MP_CMOF_Element_Owned_Comment then
            --  Element::ownedComment : Comment

            return
              AMF.CMOF.Comments.Collections.CMOF_Comment_Collections.Internals.To_Holder
               (AMF.CMOF.Expressions.CMOF_Expression_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Owned_Comment);

         elsif Property = MP_CMOF_Element_Owned_Element then
            --  Element::ownedElement : Element

            return
              AMF.CMOF.Elements.Collections.CMOF_Element_Collections.Internals.To_Holder
               (AMF.CMOF.Expressions.CMOF_Expression_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Owned_Element);

         elsif Property = MP_CMOF_Element_Owner then
            --  Element::owner : Element

            return
              AMF.Internals.Holders.CMOF_Holders.To_Holder
               (AMF.CMOF.Elements.CMOF_Element_Access'
                 (AMF.CMOF.Expressions.CMOF_Expression_Access
                   (AMF.Internals.Helpers.To_Element (Self)).Get_Owner));

         elsif Property = MP_CMOF_Named_Element_Qualified_Name then
            --  NamedElement::qualifiedName : String

            return
              AMF.Holders.To_Holder
               (AMF.CMOF.Expressions.CMOF_Expression_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Qualified_Name);

         elsif Property = MP_CMOF_Typed_Element_Type then
            --  TypedElement::type : Type

            return
              AMF.Internals.Holders.CMOF_Holders.To_Holder
               (AMF.CMOF.Types.CMOF_Type_Access'
                 (AMF.CMOF.Expressions.CMOF_Expression_Access
                   (AMF.Internals.Helpers.To_Element (Self)).Get_Type));

         elsif Property = MP_CMOF_Named_Element_Visibility then
            --  NamedElement::visibility : VisibilityKind

            return
              AMF.CMOF.Holders.To_Holder
               (AMF.CMOF.Expressions.CMOF_Expression_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Visibility);

         else
            raise Program_Error;
         end if;
      end Expression_Get;

      ---------------------------
      -- Opaque_Expression_Get --
      ---------------------------

      function Opaque_Expression_Get return League.Holders.Holder is
      begin
         if Property = MP_CMOF_Opaque_Expression_Body then
            --  OpaqueExpression::body : String

            return
              AMF.String_Collections.Internals.To_Holder
               (AMF.CMOF.Opaque_Expressions.CMOF_Opaque_Expression_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Body);

         elsif Property = MP_CMOF_Opaque_Expression_Language then
            --  OpaqueExpression::language : String

            return
              AMF.String_Collections.Internals.To_Holder
               (AMF.CMOF.Opaque_Expressions.CMOF_Opaque_Expression_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Language);

         elsif Property = MP_CMOF_Named_Element_Name then
            --  NamedElement::name : String

            return
              AMF.Holders.To_Holder
               (AMF.CMOF.Opaque_Expressions.CMOF_Opaque_Expression_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Name);

         elsif Property = MP_CMOF_Named_Element_Namespace then
            --  NamedElement::namespace : Namespace

            return
              AMF.Internals.Holders.CMOF_Holders.To_Holder
               (AMF.CMOF.Namespaces.CMOF_Namespace_Access'
                 (AMF.CMOF.Opaque_Expressions.CMOF_Opaque_Expression_Access
                   (AMF.Internals.Helpers.To_Element (Self)).Get_Namespace));

         elsif Property = MP_CMOF_Element_Owned_Comment then
            --  Element::ownedComment : Comment

            return
              AMF.CMOF.Comments.Collections.CMOF_Comment_Collections.Internals.To_Holder
               (AMF.CMOF.Opaque_Expressions.CMOF_Opaque_Expression_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Owned_Comment);

         elsif Property = MP_CMOF_Element_Owned_Element then
            --  Element::ownedElement : Element

            return
              AMF.CMOF.Elements.Collections.CMOF_Element_Collections.Internals.To_Holder
               (AMF.CMOF.Opaque_Expressions.CMOF_Opaque_Expression_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Owned_Element);

         elsif Property = MP_CMOF_Element_Owner then
            --  Element::owner : Element

            return
              AMF.Internals.Holders.CMOF_Holders.To_Holder
               (AMF.CMOF.Elements.CMOF_Element_Access'
                 (AMF.CMOF.Opaque_Expressions.CMOF_Opaque_Expression_Access
                   (AMF.Internals.Helpers.To_Element (Self)).Get_Owner));

         elsif Property = MP_CMOF_Named_Element_Qualified_Name then
            --  NamedElement::qualifiedName : String

            return
              AMF.Holders.To_Holder
               (AMF.CMOF.Opaque_Expressions.CMOF_Opaque_Expression_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Qualified_Name);

         elsif Property = MP_CMOF_Typed_Element_Type then
            --  TypedElement::type : Type

            return
              AMF.Internals.Holders.CMOF_Holders.To_Holder
               (AMF.CMOF.Types.CMOF_Type_Access'
                 (AMF.CMOF.Opaque_Expressions.CMOF_Opaque_Expression_Access
                   (AMF.Internals.Helpers.To_Element (Self)).Get_Type));

         elsif Property = MP_CMOF_Named_Element_Visibility then
            --  NamedElement::visibility : VisibilityKind

            return
              AMF.CMOF.Holders.To_Holder
               (AMF.CMOF.Opaque_Expressions.CMOF_Opaque_Expression_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Visibility);

         else
            raise Program_Error;
         end if;
      end Opaque_Expression_Get;

      -------------------
      -- Operation_Get --
      -------------------

      function Operation_Get return League.Holders.Holder is
      begin
         if Property = MP_CMOF_Operation_Body_Condition then
            --  Operation::bodyCondition : Constraint

            return
              AMF.Internals.Holders.CMOF_Holders.To_Holder
               (AMF.CMOF.Constraints.CMOF_Constraint_Access'
                 (AMF.CMOF.Operations.CMOF_Operation_Access
                   (AMF.Internals.Helpers.To_Element (Self)).Get_Body_Condition));

         elsif Property = MP_CMOF_Operation_Class then
            --  Operation::class : Class

            return
              AMF.Internals.Holders.CMOF_Holders.To_Holder
               (AMF.CMOF.Classes.CMOF_Class_Access'
                 (AMF.CMOF.Operations.CMOF_Operation_Access
                   (AMF.Internals.Helpers.To_Element (Self)).Get_Class));

         elsif Property = MP_CMOF_Operation_Datatype then
            --  Operation::datatype : DataType

            return
              AMF.Internals.Holders.CMOF_Holders.To_Holder
               (AMF.CMOF.Data_Types.CMOF_Data_Type_Access'
                 (AMF.CMOF.Operations.CMOF_Operation_Access
                   (AMF.Internals.Helpers.To_Element (Self)).Get_Datatype));

         elsif Property = MP_CMOF_Namespace_Element_Import then
            --  Namespace::elementImport : ElementImport

            return
              AMF.CMOF.Element_Imports.Collections.CMOF_Element_Import_Collections.Internals.To_Holder
               (AMF.CMOF.Operations.CMOF_Operation_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Element_Import);

         elsif Property = MP_CMOF_Feature_Featuring_Classifier then
            --  Feature::featuringClassifier : Classifier

            return
              AMF.CMOF.Classifiers.Collections.CMOF_Classifier_Collections.Internals.To_Holder
               (AMF.CMOF.Operations.CMOF_Operation_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Featuring_Classifier);

         elsif Property = MP_CMOF_Namespace_Imported_Member then
            --  Namespace::importedMember : PackageableElement

            return
              AMF.CMOF.Packageable_Elements.Collections.CMOF_Packageable_Element_Collections.Internals.To_Holder
               (AMF.CMOF.Operations.CMOF_Operation_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Imported_Member);

         elsif Property = MP_CMOF_Redefinable_Element_Is_Leaf then
            --  RedefinableElement::isLeaf : Boolean

            return
              League.Holders.Booleans.To_Holder
               (AMF.CMOF.Operations.CMOF_Operation_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Is_Leaf);

         elsif Property = MP_CMOF_Operation_Is_Ordered then
            --  Operation::isOrdered : Boolean

            return
              League.Holders.Booleans.To_Holder
               (AMF.CMOF.Operations.CMOF_Operation_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Is_Ordered);

         elsif Property = MP_CMOF_Operation_Is_Query then
            --  Operation::isQuery : Boolean

            return
              League.Holders.Booleans.To_Holder
               (AMF.CMOF.Operations.CMOF_Operation_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Is_Query);

         elsif Property = MP_CMOF_Operation_Is_Unique then
            --  Operation::isUnique : Boolean

            return
              League.Holders.Booleans.To_Holder
               (AMF.CMOF.Operations.CMOF_Operation_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Is_Unique);

         elsif Property = MP_CMOF_Operation_Lower then
            --  Operation::lower : Integer

            return
              AMF.Holders.To_Holder
               (AMF.CMOF.Operations.CMOF_Operation_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Lower);

         elsif Property = MP_CMOF_Namespace_Member then
            --  Namespace::member : NamedElement

            return
              AMF.CMOF.Named_Elements.Collections.CMOF_Named_Element_Collections.Internals.To_Holder
               (AMF.CMOF.Operations.CMOF_Operation_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Member);

         elsif Property = MP_CMOF_Named_Element_Name then
            --  NamedElement::name : String

            return
              AMF.Holders.To_Holder
               (AMF.CMOF.Operations.CMOF_Operation_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Name);

         elsif Property = MP_CMOF_Named_Element_Namespace then
            --  NamedElement::namespace : Namespace

            return
              AMF.Internals.Holders.CMOF_Holders.To_Holder
               (AMF.CMOF.Namespaces.CMOF_Namespace_Access'
                 (AMF.CMOF.Operations.CMOF_Operation_Access
                   (AMF.Internals.Helpers.To_Element (Self)).Get_Namespace));

         elsif Property = MP_CMOF_Element_Owned_Comment then
            --  Element::ownedComment : Comment

            return
              AMF.CMOF.Comments.Collections.CMOF_Comment_Collections.Internals.To_Holder
               (AMF.CMOF.Operations.CMOF_Operation_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Owned_Comment);

         elsif Property = MP_CMOF_Element_Owned_Element then
            --  Element::ownedElement : Element

            return
              AMF.CMOF.Elements.Collections.CMOF_Element_Collections.Internals.To_Holder
               (AMF.CMOF.Operations.CMOF_Operation_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Owned_Element);

         elsif Property = MP_CMOF_Namespace_Owned_Member then
            --  Namespace::ownedMember : NamedElement

            return
              AMF.CMOF.Named_Elements.Collections.CMOF_Named_Element_Collections.Internals.To_Holder
               (AMF.CMOF.Operations.CMOF_Operation_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Owned_Member);

         elsif Property = MP_CMOF_Operation_Owned_Parameter then
            --  Operation::ownedParameter : Parameter

            return
              AMF.CMOF.Parameters.Collections.CMOF_Parameter_Collections.Internals.To_Holder
               (AMF.CMOF.Operations.CMOF_Operation_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Owned_Parameter);

         elsif Property = MP_CMOF_Behavioral_Feature_Owned_Parameter then
            --  BehavioralFeature::ownedParameter : Parameter

            return
              AMF.CMOF.Parameters.Collections.CMOF_Parameter_Collections.Internals.To_Holder
               (AMF.CMOF.Operations.CMOF_Operation_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Owned_Parameter);

         elsif Property = MP_CMOF_Namespace_Owned_Rule then
            --  Namespace::ownedRule : Constraint

            return
              AMF.CMOF.Constraints.Collections.CMOF_Constraint_Collections.Internals.To_Holder
               (AMF.CMOF.Operations.CMOF_Operation_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Owned_Rule);

         elsif Property = MP_CMOF_Element_Owner then
            --  Element::owner : Element

            return
              AMF.Internals.Holders.CMOF_Holders.To_Holder
               (AMF.CMOF.Elements.CMOF_Element_Access'
                 (AMF.CMOF.Operations.CMOF_Operation_Access
                   (AMF.Internals.Helpers.To_Element (Self)).Get_Owner));

         elsif Property = MP_CMOF_Namespace_Package_Import then
            --  Namespace::packageImport : PackageImport

            return
              AMF.CMOF.Package_Imports.Collections.CMOF_Package_Import_Collections.Internals.To_Holder
               (AMF.CMOF.Operations.CMOF_Operation_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Package_Import);

         elsif Property = MP_CMOF_Operation_Postcondition then
            --  Operation::postcondition : Constraint

            return
              AMF.CMOF.Constraints.Collections.CMOF_Constraint_Collections.Internals.To_Holder
               (AMF.CMOF.Operations.CMOF_Operation_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Postcondition);

         elsif Property = MP_CMOF_Operation_Precondition then
            --  Operation::precondition : Constraint

            return
              AMF.CMOF.Constraints.Collections.CMOF_Constraint_Collections.Internals.To_Holder
               (AMF.CMOF.Operations.CMOF_Operation_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Precondition);

         elsif Property = MP_CMOF_Named_Element_Qualified_Name then
            --  NamedElement::qualifiedName : String

            return
              AMF.Holders.To_Holder
               (AMF.CMOF.Operations.CMOF_Operation_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Qualified_Name);

         elsif Property = MP_CMOF_Operation_Raised_Exception then
            --  Operation::raisedException : Type

            return
              AMF.CMOF.Types.Collections.CMOF_Type_Collections.Internals.To_Holder
               (AMF.CMOF.Operations.CMOF_Operation_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Raised_Exception);

         elsif Property = MP_CMOF_Behavioral_Feature_Raised_Exception then
            --  BehavioralFeature::raisedException : Type

            return
              AMF.CMOF.Types.Collections.CMOF_Type_Collections.Internals.To_Holder
               (AMF.CMOF.Operations.CMOF_Operation_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Raised_Exception);

         elsif Property = MP_CMOF_Redefinable_Element_Redefined_Element then
            --  RedefinableElement::redefinedElement : RedefinableElement

            return
              AMF.CMOF.Redefinable_Elements.Collections.CMOF_Redefinable_Element_Collections.Internals.To_Holder
               (AMF.CMOF.Operations.CMOF_Operation_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Redefined_Element);

         elsif Property = MP_CMOF_Operation_Redefined_Operation then
            --  Operation::redefinedOperation : Operation

            return
              AMF.CMOF.Operations.Collections.CMOF_Operation_Collections.Internals.To_Holder
               (AMF.CMOF.Operations.CMOF_Operation_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Redefined_Operation);

         elsif Property = MP_CMOF_Redefinable_Element_Redefinition_Context then
            --  RedefinableElement::redefinitionContext : Classifier

            return
              AMF.CMOF.Classifiers.Collections.CMOF_Classifier_Collections.Internals.To_Holder
               (AMF.CMOF.Operations.CMOF_Operation_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Redefinition_Context);

         elsif Property = MP_CMOF_Operation_Type then
            --  Operation::type : Type

            return
              AMF.Internals.Holders.CMOF_Holders.To_Holder
               (AMF.CMOF.Types.CMOF_Type_Access'
                 (AMF.CMOF.Operations.CMOF_Operation_Access
                   (AMF.Internals.Helpers.To_Element (Self)).Get_Type));

         elsif Property = MP_CMOF_Operation_Upper then
            --  Operation::upper : UnlimitedNatural

            return
              AMF.Holders.To_Holder
               (AMF.CMOF.Operations.CMOF_Operation_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Upper);

         elsif Property = MP_CMOF_Named_Element_Visibility then
            --  NamedElement::visibility : VisibilityKind

            return
              AMF.CMOF.Holders.To_Holder
               (AMF.CMOF.Operations.CMOF_Operation_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Visibility);

         else
            raise Program_Error;
         end if;
      end Operation_Get;

      -----------------
      -- Package_Get --
      -----------------

      function Package_Get return League.Holders.Holder is
      begin
         if Property = MP_CMOF_Namespace_Element_Import then
            --  Namespace::elementImport : ElementImport

            return
              AMF.CMOF.Element_Imports.Collections.CMOF_Element_Import_Collections.Internals.To_Holder
               (AMF.CMOF.Packages.CMOF_Package_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Element_Import);

         elsif Property = MP_CMOF_Namespace_Imported_Member then
            --  Namespace::importedMember : PackageableElement

            return
              AMF.CMOF.Packageable_Elements.Collections.CMOF_Packageable_Element_Collections.Internals.To_Holder
               (AMF.CMOF.Packages.CMOF_Package_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Imported_Member);

         elsif Property = MP_CMOF_Namespace_Member then
            --  Namespace::member : NamedElement

            return
              AMF.CMOF.Named_Elements.Collections.CMOF_Named_Element_Collections.Internals.To_Holder
               (AMF.CMOF.Packages.CMOF_Package_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Member);

         elsif Property = MP_CMOF_Named_Element_Name then
            --  NamedElement::name : String

            return
              AMF.Holders.To_Holder
               (AMF.CMOF.Packages.CMOF_Package_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Name);

         elsif Property = MP_CMOF_Named_Element_Namespace then
            --  NamedElement::namespace : Namespace

            return
              AMF.Internals.Holders.CMOF_Holders.To_Holder
               (AMF.CMOF.Namespaces.CMOF_Namespace_Access'
                 (AMF.CMOF.Packages.CMOF_Package_Access
                   (AMF.Internals.Helpers.To_Element (Self)).Get_Namespace));

         elsif Property = MP_CMOF_Package_Nested_Package then
            --  Package::nestedPackage : Package

            return
              AMF.CMOF.Packages.Collections.CMOF_Package_Collections.Internals.To_Holder
               (AMF.CMOF.Packages.CMOF_Package_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Nested_Package);

         elsif Property = MP_CMOF_Package_Nesting_Package then
            --  Package::nestingPackage : Package

            return
              AMF.Internals.Holders.CMOF_Holders.To_Holder
               (AMF.CMOF.Packages.CMOF_Package_Access'
                 (AMF.CMOF.Packages.CMOF_Package_Access
                   (AMF.Internals.Helpers.To_Element (Self)).Get_Nesting_Package));

         elsif Property = MP_CMOF_Element_Owned_Comment then
            --  Element::ownedComment : Comment

            return
              AMF.CMOF.Comments.Collections.CMOF_Comment_Collections.Internals.To_Holder
               (AMF.CMOF.Packages.CMOF_Package_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Owned_Comment);

         elsif Property = MP_CMOF_Element_Owned_Element then
            --  Element::ownedElement : Element

            return
              AMF.CMOF.Elements.Collections.CMOF_Element_Collections.Internals.To_Holder
               (AMF.CMOF.Packages.CMOF_Package_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Owned_Element);

         elsif Property = MP_CMOF_Namespace_Owned_Member then
            --  Namespace::ownedMember : NamedElement

            return
              AMF.CMOF.Named_Elements.Collections.CMOF_Named_Element_Collections.Internals.To_Holder
               (AMF.CMOF.Packages.CMOF_Package_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Owned_Member);

         elsif Property = MP_CMOF_Namespace_Owned_Rule then
            --  Namespace::ownedRule : Constraint

            return
              AMF.CMOF.Constraints.Collections.CMOF_Constraint_Collections.Internals.To_Holder
               (AMF.CMOF.Packages.CMOF_Package_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Owned_Rule);

         elsif Property = MP_CMOF_Package_Owned_Type then
            --  Package::ownedType : Type

            return
              AMF.CMOF.Types.Collections.CMOF_Type_Collections.Internals.To_Holder
               (AMF.CMOF.Packages.CMOF_Package_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Owned_Type);

         elsif Property = MP_CMOF_Element_Owner then
            --  Element::owner : Element

            return
              AMF.Internals.Holders.CMOF_Holders.To_Holder
               (AMF.CMOF.Elements.CMOF_Element_Access'
                 (AMF.CMOF.Packages.CMOF_Package_Access
                   (AMF.Internals.Helpers.To_Element (Self)).Get_Owner));

         elsif Property = MP_CMOF_Namespace_Package_Import then
            --  Namespace::packageImport : PackageImport

            return
              AMF.CMOF.Package_Imports.Collections.CMOF_Package_Import_Collections.Internals.To_Holder
               (AMF.CMOF.Packages.CMOF_Package_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Package_Import);

         elsif Property = MP_CMOF_Package_Package_Merge then
            --  Package::packageMerge : PackageMerge

            return
              AMF.CMOF.Package_Merges.Collections.CMOF_Package_Merge_Collections.Internals.To_Holder
               (AMF.CMOF.Packages.CMOF_Package_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Package_Merge);

         elsif Property = MP_CMOF_Package_Packaged_Element then
            --  Package::packagedElement : PackageableElement

            return
              AMF.CMOF.Packageable_Elements.Collections.CMOF_Packageable_Element_Collections.Internals.To_Holder
               (AMF.CMOF.Packages.CMOF_Package_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Packaged_Element);

         elsif Property = MP_CMOF_Named_Element_Qualified_Name then
            --  NamedElement::qualifiedName : String

            return
              AMF.Holders.To_Holder
               (AMF.CMOF.Packages.CMOF_Package_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Qualified_Name);

         elsif Property = MP_CMOF_Package_Uri then
            --  Package::uri : String

            return
              AMF.Holders.To_Holder
               (AMF.CMOF.Packages.CMOF_Package_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Uri);

         elsif Property = MP_CMOF_Named_Element_Visibility then
            --  NamedElement::visibility : VisibilityKind

            return
              AMF.CMOF.Holders.To_Holder
               (AMF.CMOF.Packages.CMOF_Package_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Visibility);

         else
            raise Program_Error;
         end if;
      end Package_Get;

      ------------------------
      -- Package_Import_Get --
      ------------------------

      function Package_Import_Get return League.Holders.Holder is
      begin
         if Property = MP_CMOF_Package_Import_Imported_Package then
            --  PackageImport::importedPackage : Package

            return
              AMF.Internals.Holders.CMOF_Holders.To_Holder
               (AMF.CMOF.Packages.CMOF_Package_Access'
                 (AMF.CMOF.Package_Imports.CMOF_Package_Import_Access
                   (AMF.Internals.Helpers.To_Element (Self)).Get_Imported_Package));

         elsif Property = MP_CMOF_Package_Import_Importing_Namespace then
            --  PackageImport::importingNamespace : Namespace

            return
              AMF.Internals.Holders.CMOF_Holders.To_Holder
               (AMF.CMOF.Namespaces.CMOF_Namespace_Access'
                 (AMF.CMOF.Package_Imports.CMOF_Package_Import_Access
                   (AMF.Internals.Helpers.To_Element (Self)).Get_Importing_Namespace));

         elsif Property = MP_CMOF_Element_Owned_Comment then
            --  Element::ownedComment : Comment

            return
              AMF.CMOF.Comments.Collections.CMOF_Comment_Collections.Internals.To_Holder
               (AMF.CMOF.Package_Imports.CMOF_Package_Import_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Owned_Comment);

         elsif Property = MP_CMOF_Element_Owned_Element then
            --  Element::ownedElement : Element

            return
              AMF.CMOF.Elements.Collections.CMOF_Element_Collections.Internals.To_Holder
               (AMF.CMOF.Package_Imports.CMOF_Package_Import_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Owned_Element);

         elsif Property = MP_CMOF_Element_Owner then
            --  Element::owner : Element

            return
              AMF.Internals.Holders.CMOF_Holders.To_Holder
               (AMF.CMOF.Elements.CMOF_Element_Access'
                 (AMF.CMOF.Package_Imports.CMOF_Package_Import_Access
                   (AMF.Internals.Helpers.To_Element (Self)).Get_Owner));

         elsif Property = MP_CMOF_Relationship_Related_Element then
            --  Relationship::relatedElement : Element

            return
              AMF.CMOF.Elements.Collections.CMOF_Element_Collections.Internals.To_Holder
               (AMF.CMOF.Package_Imports.CMOF_Package_Import_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Related_Element);

         elsif Property = MP_CMOF_Directed_Relationship_Source then
            --  DirectedRelationship::source : Element

            return
              AMF.CMOF.Elements.Collections.CMOF_Element_Collections.Internals.To_Holder
               (AMF.CMOF.Package_Imports.CMOF_Package_Import_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Source);

         elsif Property = MP_CMOF_Directed_Relationship_Target then
            --  DirectedRelationship::target : Element

            return
              AMF.CMOF.Elements.Collections.CMOF_Element_Collections.Internals.To_Holder
               (AMF.CMOF.Package_Imports.CMOF_Package_Import_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Target);

         elsif Property = MP_CMOF_Package_Import_Visibility then
            --  PackageImport::visibility : VisibilityKind

            return
              AMF.CMOF.Holders.Visibility_Kinds.To_Holder
               (AMF.CMOF.Package_Imports.CMOF_Package_Import_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Visibility);

         else
            raise Program_Error;
         end if;
      end Package_Import_Get;

      -----------------------
      -- Package_Merge_Get --
      -----------------------

      function Package_Merge_Get return League.Holders.Holder is
      begin
         if Property = MP_CMOF_Package_Merge_Merged_Package then
            --  PackageMerge::mergedPackage : Package

            return
              AMF.Internals.Holders.CMOF_Holders.To_Holder
               (AMF.CMOF.Packages.CMOF_Package_Access'
                 (AMF.CMOF.Package_Merges.CMOF_Package_Merge_Access
                   (AMF.Internals.Helpers.To_Element (Self)).Get_Merged_Package));

         elsif Property = MP_CMOF_Element_Owned_Comment then
            --  Element::ownedComment : Comment

            return
              AMF.CMOF.Comments.Collections.CMOF_Comment_Collections.Internals.To_Holder
               (AMF.CMOF.Package_Merges.CMOF_Package_Merge_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Owned_Comment);

         elsif Property = MP_CMOF_Element_Owned_Element then
            --  Element::ownedElement : Element

            return
              AMF.CMOF.Elements.Collections.CMOF_Element_Collections.Internals.To_Holder
               (AMF.CMOF.Package_Merges.CMOF_Package_Merge_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Owned_Element);

         elsif Property = MP_CMOF_Element_Owner then
            --  Element::owner : Element

            return
              AMF.Internals.Holders.CMOF_Holders.To_Holder
               (AMF.CMOF.Elements.CMOF_Element_Access'
                 (AMF.CMOF.Package_Merges.CMOF_Package_Merge_Access
                   (AMF.Internals.Helpers.To_Element (Self)).Get_Owner));

         elsif Property = MP_CMOF_Package_Merge_Receiving_Package then
            --  PackageMerge::receivingPackage : Package

            return
              AMF.Internals.Holders.CMOF_Holders.To_Holder
               (AMF.CMOF.Packages.CMOF_Package_Access'
                 (AMF.CMOF.Package_Merges.CMOF_Package_Merge_Access
                   (AMF.Internals.Helpers.To_Element (Self)).Get_Receiving_Package));

         elsif Property = MP_CMOF_Relationship_Related_Element then
            --  Relationship::relatedElement : Element

            return
              AMF.CMOF.Elements.Collections.CMOF_Element_Collections.Internals.To_Holder
               (AMF.CMOF.Package_Merges.CMOF_Package_Merge_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Related_Element);

         elsif Property = MP_CMOF_Directed_Relationship_Source then
            --  DirectedRelationship::source : Element

            return
              AMF.CMOF.Elements.Collections.CMOF_Element_Collections.Internals.To_Holder
               (AMF.CMOF.Package_Merges.CMOF_Package_Merge_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Source);

         elsif Property = MP_CMOF_Directed_Relationship_Target then
            --  DirectedRelationship::target : Element

            return
              AMF.CMOF.Elements.Collections.CMOF_Element_Collections.Internals.To_Holder
               (AMF.CMOF.Package_Merges.CMOF_Package_Merge_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Target);

         else
            raise Program_Error;
         end if;
      end Package_Merge_Get;

      -------------------
      -- Parameter_Get --
      -------------------

      function Parameter_Get return League.Holders.Holder is
      begin
         if Property = MP_CMOF_Parameter_Default then
            --  Parameter::default : String

            return
              AMF.Holders.To_Holder
               (AMF.CMOF.Parameters.CMOF_Parameter_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Default);

         elsif Property = MP_CMOF_Parameter_Direction then
            --  Parameter::direction : ParameterDirectionKind

            return
              AMF.CMOF.Holders.Parameter_Direction_Kinds.To_Holder
               (AMF.CMOF.Parameters.CMOF_Parameter_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Direction);

         elsif Property = MP_CMOF_Multiplicity_Element_Is_Ordered then
            --  MultiplicityElement::isOrdered : Boolean

            return
              League.Holders.Booleans.To_Holder
               (AMF.CMOF.Parameters.CMOF_Parameter_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Is_Ordered);

         elsif Property = MP_CMOF_Multiplicity_Element_Is_Unique then
            --  MultiplicityElement::isUnique : Boolean

            return
              League.Holders.Booleans.To_Holder
               (AMF.CMOF.Parameters.CMOF_Parameter_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Is_Unique);

         elsif Property = MP_CMOF_Multiplicity_Element_Lower then
            --  MultiplicityElement::lower : Integer

            return
              AMF.Holders.To_Holder
               (AMF.CMOF.Parameters.CMOF_Parameter_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Lower);

         elsif Property = MP_CMOF_Named_Element_Name then
            --  NamedElement::name : String

            return
              AMF.Holders.To_Holder
               (AMF.CMOF.Parameters.CMOF_Parameter_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Name);

         elsif Property = MP_CMOF_Named_Element_Namespace then
            --  NamedElement::namespace : Namespace

            return
              AMF.Internals.Holders.CMOF_Holders.To_Holder
               (AMF.CMOF.Namespaces.CMOF_Namespace_Access'
                 (AMF.CMOF.Parameters.CMOF_Parameter_Access
                   (AMF.Internals.Helpers.To_Element (Self)).Get_Namespace));

         elsif Property = MP_CMOF_Parameter_Operation then
            --  Parameter::operation : Operation

            return
              AMF.Internals.Holders.CMOF_Holders.To_Holder
               (AMF.CMOF.Operations.CMOF_Operation_Access'
                 (AMF.CMOF.Parameters.CMOF_Parameter_Access
                   (AMF.Internals.Helpers.To_Element (Self)).Get_Operation));

         elsif Property = MP_CMOF_Element_Owned_Comment then
            --  Element::ownedComment : Comment

            return
              AMF.CMOF.Comments.Collections.CMOF_Comment_Collections.Internals.To_Holder
               (AMF.CMOF.Parameters.CMOF_Parameter_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Owned_Comment);

         elsif Property = MP_CMOF_Element_Owned_Element then
            --  Element::ownedElement : Element

            return
              AMF.CMOF.Elements.Collections.CMOF_Element_Collections.Internals.To_Holder
               (AMF.CMOF.Parameters.CMOF_Parameter_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Owned_Element);

         elsif Property = MP_CMOF_Element_Owner then
            --  Element::owner : Element

            return
              AMF.Internals.Holders.CMOF_Holders.To_Holder
               (AMF.CMOF.Elements.CMOF_Element_Access'
                 (AMF.CMOF.Parameters.CMOF_Parameter_Access
                   (AMF.Internals.Helpers.To_Element (Self)).Get_Owner));

         elsif Property = MP_CMOF_Named_Element_Qualified_Name then
            --  NamedElement::qualifiedName : String

            return
              AMF.Holders.To_Holder
               (AMF.CMOF.Parameters.CMOF_Parameter_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Qualified_Name);

         elsif Property = MP_CMOF_Typed_Element_Type then
            --  TypedElement::type : Type

            return
              AMF.Internals.Holders.CMOF_Holders.To_Holder
               (AMF.CMOF.Types.CMOF_Type_Access'
                 (AMF.CMOF.Parameters.CMOF_Parameter_Access
                   (AMF.Internals.Helpers.To_Element (Self)).Get_Type));

         elsif Property = MP_CMOF_Multiplicity_Element_Upper then
            --  MultiplicityElement::upper : UnlimitedNatural

            return
              AMF.Holders.To_Holder
               (AMF.CMOF.Parameters.CMOF_Parameter_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Upper);

         elsif Property = MP_CMOF_Named_Element_Visibility then
            --  NamedElement::visibility : VisibilityKind

            return
              AMF.CMOF.Holders.To_Holder
               (AMF.CMOF.Parameters.CMOF_Parameter_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Visibility);

         else
            raise Program_Error;
         end if;
      end Parameter_Get;

      ------------------------
      -- Primitive_Type_Get --
      ------------------------

      function Primitive_Type_Get return League.Holders.Holder is
      begin
         if Property = MP_CMOF_Classifier_Attribute then
            --  Classifier::attribute : Property

            return
              AMF.CMOF.Properties.Collections.CMOF_Property_Collections.Internals.To_Holder
               (AMF.CMOF.Primitive_Types.CMOF_Primitive_Type_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Attribute);

         elsif Property = MP_CMOF_Namespace_Element_Import then
            --  Namespace::elementImport : ElementImport

            return
              AMF.CMOF.Element_Imports.Collections.CMOF_Element_Import_Collections.Internals.To_Holder
               (AMF.CMOF.Primitive_Types.CMOF_Primitive_Type_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Element_Import);

         elsif Property = MP_CMOF_Classifier_Feature then
            --  Classifier::feature : Feature

            return
              AMF.CMOF.Features.Collections.CMOF_Feature_Collections.Internals.To_Holder
               (AMF.CMOF.Primitive_Types.CMOF_Primitive_Type_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Feature);

         elsif Property = MP_CMOF_Classifier_General then
            --  Classifier::general : Classifier

            return
              AMF.CMOF.Classifiers.Collections.CMOF_Classifier_Collections.Internals.To_Holder
               (AMF.CMOF.Primitive_Types.CMOF_Primitive_Type_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_General);

         elsif Property = MP_CMOF_Namespace_Imported_Member then
            --  Namespace::importedMember : PackageableElement

            return
              AMF.CMOF.Packageable_Elements.Collections.CMOF_Packageable_Element_Collections.Internals.To_Holder
               (AMF.CMOF.Primitive_Types.CMOF_Primitive_Type_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Imported_Member);

         elsif Property = MP_CMOF_Classifier_Inherited_Member then
            --  Classifier::inheritedMember : NamedElement

            return
              AMF.CMOF.Named_Elements.Collections.CMOF_Named_Element_Collections.Internals.To_Holder
               (AMF.CMOF.Primitive_Types.CMOF_Primitive_Type_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Inherited_Member);

         elsif Property = MP_CMOF_Classifier_Is_Final_Specialization then
            --  Classifier::isFinalSpecialization : Boolean

            return
              League.Holders.Booleans.To_Holder
               (AMF.CMOF.Primitive_Types.CMOF_Primitive_Type_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Is_Final_Specialization);

         elsif Property = MP_CMOF_Namespace_Member then
            --  Namespace::member : NamedElement

            return
              AMF.CMOF.Named_Elements.Collections.CMOF_Named_Element_Collections.Internals.To_Holder
               (AMF.CMOF.Primitive_Types.CMOF_Primitive_Type_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Member);

         elsif Property = MP_CMOF_Named_Element_Name then
            --  NamedElement::name : String

            return
              AMF.Holders.To_Holder
               (AMF.CMOF.Primitive_Types.CMOF_Primitive_Type_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Name);

         elsif Property = MP_CMOF_Named_Element_Namespace then
            --  NamedElement::namespace : Namespace

            return
              AMF.Internals.Holders.CMOF_Holders.To_Holder
               (AMF.CMOF.Namespaces.CMOF_Namespace_Access'
                 (AMF.CMOF.Primitive_Types.CMOF_Primitive_Type_Access
                   (AMF.Internals.Helpers.To_Element (Self)).Get_Namespace));

         elsif Property = MP_CMOF_Data_Type_Owned_Attribute then
            --  DataType::ownedAttribute : Property

            return
              AMF.CMOF.Properties.Collections.CMOF_Property_Collections.Internals.To_Holder
               (AMF.CMOF.Primitive_Types.CMOF_Primitive_Type_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Owned_Attribute);

         elsif Property = MP_CMOF_Element_Owned_Comment then
            --  Element::ownedComment : Comment

            return
              AMF.CMOF.Comments.Collections.CMOF_Comment_Collections.Internals.To_Holder
               (AMF.CMOF.Primitive_Types.CMOF_Primitive_Type_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Owned_Comment);

         elsif Property = MP_CMOF_Element_Owned_Element then
            --  Element::ownedElement : Element

            return
              AMF.CMOF.Elements.Collections.CMOF_Element_Collections.Internals.To_Holder
               (AMF.CMOF.Primitive_Types.CMOF_Primitive_Type_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Owned_Element);

         elsif Property = MP_CMOF_Namespace_Owned_Member then
            --  Namespace::ownedMember : NamedElement

            return
              AMF.CMOF.Named_Elements.Collections.CMOF_Named_Element_Collections.Internals.To_Holder
               (AMF.CMOF.Primitive_Types.CMOF_Primitive_Type_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Owned_Member);

         elsif Property = MP_CMOF_Data_Type_Owned_Operation then
            --  DataType::ownedOperation : Operation

            return
              AMF.CMOF.Operations.Collections.CMOF_Operation_Collections.Internals.To_Holder
               (AMF.CMOF.Primitive_Types.CMOF_Primitive_Type_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Owned_Operation);

         elsif Property = MP_CMOF_Namespace_Owned_Rule then
            --  Namespace::ownedRule : Constraint

            return
              AMF.CMOF.Constraints.Collections.CMOF_Constraint_Collections.Internals.To_Holder
               (AMF.CMOF.Primitive_Types.CMOF_Primitive_Type_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Owned_Rule);

         elsif Property = MP_CMOF_Element_Owner then
            --  Element::owner : Element

            return
              AMF.Internals.Holders.CMOF_Holders.To_Holder
               (AMF.CMOF.Elements.CMOF_Element_Access'
                 (AMF.CMOF.Primitive_Types.CMOF_Primitive_Type_Access
                   (AMF.Internals.Helpers.To_Element (Self)).Get_Owner));

         elsif Property = MP_CMOF_Type_Package then
            --  Type::package : Package

            return
              AMF.Internals.Holders.CMOF_Holders.To_Holder
               (AMF.CMOF.Packages.CMOF_Package_Access'
                 (AMF.CMOF.Primitive_Types.CMOF_Primitive_Type_Access
                   (AMF.Internals.Helpers.To_Element (Self)).Get_Package));

         elsif Property = MP_CMOF_Namespace_Package_Import then
            --  Namespace::packageImport : PackageImport

            return
              AMF.CMOF.Package_Imports.Collections.CMOF_Package_Import_Collections.Internals.To_Holder
               (AMF.CMOF.Primitive_Types.CMOF_Primitive_Type_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Package_Import);

         elsif Property = MP_CMOF_Named_Element_Qualified_Name then
            --  NamedElement::qualifiedName : String

            return
              AMF.Holders.To_Holder
               (AMF.CMOF.Primitive_Types.CMOF_Primitive_Type_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Qualified_Name);

         elsif Property = MP_CMOF_Named_Element_Visibility then
            --  NamedElement::visibility : VisibilityKind

            return
              AMF.CMOF.Holders.To_Holder
               (AMF.CMOF.Primitive_Types.CMOF_Primitive_Type_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Visibility);

         else
            raise Program_Error;
         end if;
      end Primitive_Type_Get;

      ------------------
      -- Property_Get --
      ------------------

      function Property_Get return League.Holders.Holder is
      begin
         if Property = MP_CMOF_Property_Association then
            --  Property::association : Association

            return
              AMF.Internals.Holders.CMOF_Holders.To_Holder
               (AMF.CMOF.Associations.CMOF_Association_Access'
                 (AMF.CMOF.Properties.CMOF_Property_Access
                   (AMF.Internals.Helpers.To_Element (Self)).Get_Association));

         elsif Property = MP_CMOF_Property_Class then
            --  Property::class : Class

            return
              AMF.Internals.Holders.CMOF_Holders.To_Holder
               (AMF.CMOF.Classes.CMOF_Class_Access'
                 (AMF.CMOF.Properties.CMOF_Property_Access
                   (AMF.Internals.Helpers.To_Element (Self)).Get_Class));

         elsif Property = MP_CMOF_Property_Datatype then
            --  Property::datatype : DataType

            return
              AMF.Internals.Holders.CMOF_Holders.To_Holder
               (AMF.CMOF.Data_Types.CMOF_Data_Type_Access'
                 (AMF.CMOF.Properties.CMOF_Property_Access
                   (AMF.Internals.Helpers.To_Element (Self)).Get_Datatype));

         elsif Property = MP_CMOF_Property_Default then
            --  Property::default : String

            return
              AMF.Holders.To_Holder
               (AMF.CMOF.Properties.CMOF_Property_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Default);

         elsif Property = MP_CMOF_Feature_Featuring_Classifier then
            --  Feature::featuringClassifier : Classifier

            return
              AMF.CMOF.Classifiers.Collections.CMOF_Classifier_Collections.Internals.To_Holder
               (AMF.CMOF.Properties.CMOF_Property_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Featuring_Classifier);

         elsif Property = MP_CMOF_Property_Is_Composite then
            --  Property::isComposite : Boolean

            return
              League.Holders.Booleans.To_Holder
               (AMF.CMOF.Properties.CMOF_Property_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Is_Composite);

         elsif Property = MP_CMOF_Property_Is_Derived then
            --  Property::isDerived : Boolean

            return
              League.Holders.Booleans.To_Holder
               (AMF.CMOF.Properties.CMOF_Property_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Is_Derived);

         elsif Property = MP_CMOF_Property_Is_Derived_Union then
            --  Property::isDerivedUnion : Boolean

            return
              League.Holders.Booleans.To_Holder
               (AMF.CMOF.Properties.CMOF_Property_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Is_Derived_Union);

         elsif Property = MP_CMOF_Redefinable_Element_Is_Leaf then
            --  RedefinableElement::isLeaf : Boolean

            return
              League.Holders.Booleans.To_Holder
               (AMF.CMOF.Properties.CMOF_Property_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Is_Leaf);

         elsif Property = MP_CMOF_Multiplicity_Element_Is_Ordered then
            --  MultiplicityElement::isOrdered : Boolean

            return
              League.Holders.Booleans.To_Holder
               (AMF.CMOF.Properties.CMOF_Property_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Is_Ordered);

         elsif Property = MP_CMOF_Property_Is_Read_Only then
            --  Property::isReadOnly : Boolean

            return
              League.Holders.Booleans.To_Holder
               (AMF.CMOF.Properties.CMOF_Property_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Is_Read_Only);

         elsif Property = MP_CMOF_Multiplicity_Element_Is_Unique then
            --  MultiplicityElement::isUnique : Boolean

            return
              League.Holders.Booleans.To_Holder
               (AMF.CMOF.Properties.CMOF_Property_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Is_Unique);

         elsif Property = MP_CMOF_Multiplicity_Element_Lower then
            --  MultiplicityElement::lower : Integer

            return
              AMF.Holders.To_Holder
               (AMF.CMOF.Properties.CMOF_Property_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Lower);

         elsif Property = MP_CMOF_Named_Element_Name then
            --  NamedElement::name : String

            return
              AMF.Holders.To_Holder
               (AMF.CMOF.Properties.CMOF_Property_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Name);

         elsif Property = MP_CMOF_Named_Element_Namespace then
            --  NamedElement::namespace : Namespace

            return
              AMF.Internals.Holders.CMOF_Holders.To_Holder
               (AMF.CMOF.Namespaces.CMOF_Namespace_Access'
                 (AMF.CMOF.Properties.CMOF_Property_Access
                   (AMF.Internals.Helpers.To_Element (Self)).Get_Namespace));

         elsif Property = MP_CMOF_Property_Opposite then
            --  Property::opposite : Property

            return
              AMF.Internals.Holders.CMOF_Holders.To_Holder
               (AMF.CMOF.Properties.CMOF_Property_Access'
                 (AMF.CMOF.Properties.CMOF_Property_Access
                   (AMF.Internals.Helpers.To_Element (Self)).Get_Opposite));

         elsif Property = MP_CMOF_Element_Owned_Comment then
            --  Element::ownedComment : Comment

            return
              AMF.CMOF.Comments.Collections.CMOF_Comment_Collections.Internals.To_Holder
               (AMF.CMOF.Properties.CMOF_Property_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Owned_Comment);

         elsif Property = MP_CMOF_Element_Owned_Element then
            --  Element::ownedElement : Element

            return
              AMF.CMOF.Elements.Collections.CMOF_Element_Collections.Internals.To_Holder
               (AMF.CMOF.Properties.CMOF_Property_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Owned_Element);

         elsif Property = MP_CMOF_Element_Owner then
            --  Element::owner : Element

            return
              AMF.Internals.Holders.CMOF_Holders.To_Holder
               (AMF.CMOF.Elements.CMOF_Element_Access'
                 (AMF.CMOF.Properties.CMOF_Property_Access
                   (AMF.Internals.Helpers.To_Element (Self)).Get_Owner));

         elsif Property = MP_CMOF_Property_Owning_Association then
            --  Property::owningAssociation : Association

            return
              AMF.Internals.Holders.CMOF_Holders.To_Holder
               (AMF.CMOF.Associations.CMOF_Association_Access'
                 (AMF.CMOF.Properties.CMOF_Property_Access
                   (AMF.Internals.Helpers.To_Element (Self)).Get_Owning_Association));

         elsif Property = MP_CMOF_Named_Element_Qualified_Name then
            --  NamedElement::qualifiedName : String

            return
              AMF.Holders.To_Holder
               (AMF.CMOF.Properties.CMOF_Property_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Qualified_Name);

         elsif Property = MP_CMOF_Redefinable_Element_Redefined_Element then
            --  RedefinableElement::redefinedElement : RedefinableElement

            return
              AMF.CMOF.Redefinable_Elements.Collections.CMOF_Redefinable_Element_Collections.Internals.To_Holder
               (AMF.CMOF.Properties.CMOF_Property_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Redefined_Element);

         elsif Property = MP_CMOF_Property_Redefined_Property then
            --  Property::redefinedProperty : Property

            return
              AMF.CMOF.Properties.Collections.CMOF_Property_Collections.Internals.To_Holder
               (AMF.CMOF.Properties.CMOF_Property_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Redefined_Property);

         elsif Property = MP_CMOF_Redefinable_Element_Redefinition_Context then
            --  RedefinableElement::redefinitionContext : Classifier

            return
              AMF.CMOF.Classifiers.Collections.CMOF_Classifier_Collections.Internals.To_Holder
               (AMF.CMOF.Properties.CMOF_Property_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Redefinition_Context);

         elsif Property = MP_CMOF_Property_Subsetted_Property then
            --  Property::subsettedProperty : Property

            return
              AMF.CMOF.Properties.Collections.CMOF_Property_Collections.Internals.To_Holder
               (AMF.CMOF.Properties.CMOF_Property_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Subsetted_Property);

         elsif Property = MP_CMOF_Typed_Element_Type then
            --  TypedElement::type : Type

            return
              AMF.Internals.Holders.CMOF_Holders.To_Holder
               (AMF.CMOF.Types.CMOF_Type_Access'
                 (AMF.CMOF.Properties.CMOF_Property_Access
                   (AMF.Internals.Helpers.To_Element (Self)).Get_Type));

         elsif Property = MP_CMOF_Multiplicity_Element_Upper then
            --  MultiplicityElement::upper : UnlimitedNatural

            return
              AMF.Holders.To_Holder
               (AMF.CMOF.Properties.CMOF_Property_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Upper);

         elsif Property = MP_CMOF_Named_Element_Visibility then
            --  NamedElement::visibility : VisibilityKind

            return
              AMF.CMOF.Holders.To_Holder
               (AMF.CMOF.Properties.CMOF_Property_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Visibility);

         else
            raise Program_Error;
         end if;
      end Property_Get;

      -------------
      -- Tag_Get --
      -------------

      function Tag_Get return League.Holders.Holder is
      begin
         if Property = MP_CMOF_Tag_Element then
            --  Tag::element : Element

            return
              AMF.CMOF.Elements.Collections.CMOF_Element_Collections.Internals.To_Holder
               (AMF.CMOF.Tags.CMOF_Tag_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Element);

         elsif Property = MP_CMOF_Tag_Name then
            --  Tag::name : String

            return
              League.Holders.To_Holder
               (AMF.CMOF.Tags.CMOF_Tag_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Name);

         elsif Property = MP_CMOF_Element_Owned_Comment then
            --  Element::ownedComment : Comment

            return
              AMF.CMOF.Comments.Collections.CMOF_Comment_Collections.Internals.To_Holder
               (AMF.CMOF.Tags.CMOF_Tag_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Owned_Comment);

         elsif Property = MP_CMOF_Element_Owned_Element then
            --  Element::ownedElement : Element

            return
              AMF.CMOF.Elements.Collections.CMOF_Element_Collections.Internals.To_Holder
               (AMF.CMOF.Tags.CMOF_Tag_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Owned_Element);

         elsif Property = MP_CMOF_Element_Owner then
            --  Element::owner : Element

            return
              AMF.Internals.Holders.CMOF_Holders.To_Holder
               (AMF.CMOF.Elements.CMOF_Element_Access'
                 (AMF.CMOF.Tags.CMOF_Tag_Access
                   (AMF.Internals.Helpers.To_Element (Self)).Get_Owner));

         elsif Property = MP_CMOF_Tag_Tag_Owner then
            --  Tag::tagOwner : Element

            return
              AMF.Internals.Holders.CMOF_Holders.To_Holder
               (AMF.CMOF.Elements.CMOF_Element_Access'
                 (AMF.CMOF.Tags.CMOF_Tag_Access
                   (AMF.Internals.Helpers.To_Element (Self)).Get_Tag_Owner));

         elsif Property = MP_CMOF_Tag_Value then
            --  Tag::value : String

            return
              League.Holders.To_Holder
               (AMF.CMOF.Tags.CMOF_Tag_Access
                 (AMF.Internals.Helpers.To_Element (Self)).Get_Value);

         else
            raise Program_Error;
         end if;
      end Tag_Get;

   begin
      case CMOF_Element_Table.Table (Self).Kind is
         when E_None =>
            raise Program_Error;

         when E_Association =>
            return Association_Get;

         when E_Class =>
            return Class_Get;

         when E_Comment =>
            return Comment_Get;

         when E_Constraint =>
            return Constraint_Get;

         when E_Data_Type =>
            return Data_Type_Get;

         when E_Element_Import =>
            return Element_Import_Get;

         when E_Enumeration =>
            return Enumeration_Get;

         when E_Enumeration_Literal =>
            return Enumeration_Literal_Get;

         when E_Expression =>
            return Expression_Get;

         when E_Opaque_Expression =>
            return Opaque_Expression_Get;

         when E_Operation =>
            return Operation_Get;

         when E_Package =>
            return Package_Get;

         when E_Package_Import =>
            return Package_Import_Get;

         when E_Package_Merge =>
            return Package_Merge_Get;

         when E_Parameter =>
            return Parameter_Get;

         when E_Primitive_Type =>
            return Primitive_Type_Get;

         when E_Property =>
            return Property_Get;

         when E_Tag =>
            return Tag_Get;
      end case;
   end Get;

   --------------------
   -- Get_Meta_Class --
   --------------------

   function Get_Meta_Class (Self : CMOF_Element) return CMOF_Element is
   begin
      case CMOF_Element_Table.Table (Self).Kind is
         when E_None =>
            return 0;

         when E_Association =>
            return AMF.Internals.Tables.CMOF_Metamodel.MC_CMOF_Association;

         when E_Class =>
            return AMF.Internals.Tables.CMOF_Metamodel.MC_CMOF_Class;

         when E_Comment =>
            return AMF.Internals.Tables.CMOF_Metamodel.MC_CMOF_Comment;

         when E_Constraint =>
            return AMF.Internals.Tables.CMOF_Metamodel.MC_CMOF_Constraint;

         when E_Data_Type =>
            return AMF.Internals.Tables.CMOF_Metamodel.MC_CMOF_Data_Type;

         when E_Element_Import =>
            return AMF.Internals.Tables.CMOF_Metamodel.MC_CMOF_Element_Import;

         when E_Enumeration =>
            return AMF.Internals.Tables.CMOF_Metamodel.MC_CMOF_Enumeration;

         when E_Enumeration_Literal =>
            return AMF.Internals.Tables.CMOF_Metamodel.MC_CMOF_Enumeration_Literal;

         when E_Expression =>
            return AMF.Internals.Tables.CMOF_Metamodel.MC_CMOF_Expression;

         when E_Opaque_Expression =>
            return AMF.Internals.Tables.CMOF_Metamodel.MC_CMOF_Opaque_Expression;

         when E_Operation =>
            return AMF.Internals.Tables.CMOF_Metamodel.MC_CMOF_Operation;

         when E_Package =>
            return AMF.Internals.Tables.CMOF_Metamodel.MC_CMOF_Package;

         when E_Package_Import =>
            return AMF.Internals.Tables.CMOF_Metamodel.MC_CMOF_Package_Import;

         when E_Package_Merge =>
            return AMF.Internals.Tables.CMOF_Metamodel.MC_CMOF_Package_Merge;

         when E_Parameter =>
            return AMF.Internals.Tables.CMOF_Metamodel.MC_CMOF_Parameter;

         when E_Primitive_Type =>
            return AMF.Internals.Tables.CMOF_Metamodel.MC_CMOF_Primitive_Type;

         when E_Property =>
            return AMF.Internals.Tables.CMOF_Metamodel.MC_CMOF_Property;

         when E_Tag =>
            return AMF.Internals.Tables.CMOF_Metamodel.MC_CMOF_Tag;
      end case;
   end Get_Meta_Class;

   ---------
   -- Set --
   ---------

   procedure Set
    (Self     : CMOF_Element;
     Property : CMOF_Element;
     Value    : League.Holders.Holder)
   is

      procedure Association_Set;
      --  Sets attribute's value of instance of Association class.

      procedure Class_Set;
      --  Sets attribute's value of instance of Class class.

      procedure Comment_Set;
      --  Sets attribute's value of instance of Comment class.

      procedure Constraint_Set;
      --  Sets attribute's value of instance of Constraint class.

      procedure Data_Type_Set;
      --  Sets attribute's value of instance of DataType class.

      procedure Element_Import_Set;
      --  Sets attribute's value of instance of ElementImport class.

      procedure Enumeration_Set;
      --  Sets attribute's value of instance of Enumeration class.

      procedure Enumeration_Literal_Set;
      --  Sets attribute's value of instance of EnumerationLiteral class.

      procedure Expression_Set;
      --  Sets attribute's value of instance of Expression class.

      procedure Opaque_Expression_Set;
      --  Sets attribute's value of instance of OpaqueExpression class.

      procedure Operation_Set;
      --  Sets attribute's value of instance of Operation class.

      procedure Package_Set;
      --  Sets attribute's value of instance of Package class.

      procedure Package_Import_Set;
      --  Sets attribute's value of instance of PackageImport class.

      procedure Package_Merge_Set;
      --  Sets attribute's value of instance of PackageMerge class.

      procedure Parameter_Set;
      --  Sets attribute's value of instance of Parameter class.

      procedure Primitive_Type_Set;
      --  Sets attribute's value of instance of PrimitiveType class.

      procedure Property_Set;
      --  Sets attribute's value of instance of Property class.

      procedure Tag_Set;
      --  Sets attribute's value of instance of Tag class.

      ---------------------
      -- Association_Set --
      ---------------------

      procedure Association_Set is
      begin
         if Property = MP_CMOF_Association_Is_Derived then
            --  Association::isDerived : Boolean

            AMF.CMOF.Associations.CMOF_Association_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Is_Derived
               (League.Holders.Booleans.Element (Value));

         elsif Property = MP_CMOF_Classifier_Is_Final_Specialization then
            --  Classifier::isFinalSpecialization : Boolean

            AMF.CMOF.Associations.CMOF_Association_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Is_Final_Specialization
               (League.Holders.Booleans.Element (Value));

         elsif Property = MP_CMOF_Named_Element_Name then
            --  NamedElement::name : String

            AMF.CMOF.Associations.CMOF_Association_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Name
               (AMF.Holders.Element (Value));

         elsif Property = MP_CMOF_Type_Package then
            --  Type::package : Package

            AMF.CMOF.Associations.CMOF_Association_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Package
               (AMF.CMOF.Packages.CMOF_Package_Access (AMF.Holders.Elements.Element (Value)));

         elsif Property = MP_CMOF_Named_Element_Visibility then
            --  NamedElement::visibility : VisibilityKind

            AMF.CMOF.Associations.CMOF_Association_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Visibility
               (AMF.CMOF.Holders.Element (Value));

         else
            raise Program_Error;
         end if;
      end Association_Set;

      ---------------
      -- Class_Set --
      ---------------

      procedure Class_Set is
      begin
         if Property = MP_CMOF_Class_Is_Abstract then
            --  Class::isAbstract : Boolean

            AMF.CMOF.Classes.CMOF_Class_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Is_Abstract
               (League.Holders.Booleans.Element (Value));

         elsif Property = MP_CMOF_Classifier_Is_Final_Specialization then
            --  Classifier::isFinalSpecialization : Boolean

            AMF.CMOF.Classes.CMOF_Class_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Is_Final_Specialization
               (League.Holders.Booleans.Element (Value));

         elsif Property = MP_CMOF_Named_Element_Name then
            --  NamedElement::name : String

            AMF.CMOF.Classes.CMOF_Class_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Name
               (AMF.Holders.Element (Value));

         elsif Property = MP_CMOF_Type_Package then
            --  Type::package : Package

            AMF.CMOF.Classes.CMOF_Class_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Package
               (AMF.CMOF.Packages.CMOF_Package_Access (AMF.Holders.Elements.Element (Value)));

         elsif Property = MP_CMOF_Named_Element_Visibility then
            --  NamedElement::visibility : VisibilityKind

            AMF.CMOF.Classes.CMOF_Class_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Visibility
               (AMF.CMOF.Holders.Element (Value));

         else
            raise Program_Error;
         end if;
      end Class_Set;

      -----------------
      -- Comment_Set --
      -----------------

      procedure Comment_Set is
      begin
         if Property = MP_CMOF_Comment_Body then
            --  Comment::body : String

            AMF.CMOF.Comments.CMOF_Comment_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Body
               (AMF.Holders.Element (Value));

         else
            raise Program_Error;
         end if;
      end Comment_Set;

      --------------------
      -- Constraint_Set --
      --------------------

      procedure Constraint_Set is
      begin
         if Property = MP_CMOF_Constraint_Context then
            --  Constraint::context : Namespace

            AMF.CMOF.Constraints.CMOF_Constraint_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Context
               (AMF.CMOF.Namespaces.CMOF_Namespace_Access (AMF.Holders.Elements.Element (Value)));

         elsif Property = MP_CMOF_Named_Element_Name then
            --  NamedElement::name : String

            AMF.CMOF.Constraints.CMOF_Constraint_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Name
               (AMF.Holders.Element (Value));

         elsif Property = MP_CMOF_Constraint_Specification then
            --  Constraint::specification : ValueSpecification

            AMF.CMOF.Constraints.CMOF_Constraint_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Specification
               (AMF.CMOF.Value_Specifications.CMOF_Value_Specification_Access (AMF.Holders.Elements.Element (Value)));

         elsif Property = MP_CMOF_Named_Element_Visibility then
            --  NamedElement::visibility : VisibilityKind

            AMF.CMOF.Constraints.CMOF_Constraint_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Visibility
               (AMF.CMOF.Holders.Element (Value));

         else
            raise Program_Error;
         end if;
      end Constraint_Set;

      -------------------
      -- Data_Type_Set --
      -------------------

      procedure Data_Type_Set is
      begin
         if Property = MP_CMOF_Classifier_Is_Final_Specialization then
            --  Classifier::isFinalSpecialization : Boolean

            AMF.CMOF.Data_Types.CMOF_Data_Type_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Is_Final_Specialization
               (League.Holders.Booleans.Element (Value));

         elsif Property = MP_CMOF_Named_Element_Name then
            --  NamedElement::name : String

            AMF.CMOF.Data_Types.CMOF_Data_Type_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Name
               (AMF.Holders.Element (Value));

         elsif Property = MP_CMOF_Type_Package then
            --  Type::package : Package

            AMF.CMOF.Data_Types.CMOF_Data_Type_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Package
               (AMF.CMOF.Packages.CMOF_Package_Access (AMF.Holders.Elements.Element (Value)));

         elsif Property = MP_CMOF_Named_Element_Visibility then
            --  NamedElement::visibility : VisibilityKind

            AMF.CMOF.Data_Types.CMOF_Data_Type_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Visibility
               (AMF.CMOF.Holders.Element (Value));

         else
            raise Program_Error;
         end if;
      end Data_Type_Set;

      ------------------------
      -- Element_Import_Set --
      ------------------------

      procedure Element_Import_Set is
      begin
         if Property = MP_CMOF_Element_Import_Alias then
            --  ElementImport::alias : String

            AMF.CMOF.Element_Imports.CMOF_Element_Import_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Alias
               (AMF.Holders.Element (Value));

         elsif Property = MP_CMOF_Element_Import_Imported_Element then
            --  ElementImport::importedElement : PackageableElement

            AMF.CMOF.Element_Imports.CMOF_Element_Import_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Imported_Element
               (AMF.CMOF.Packageable_Elements.CMOF_Packageable_Element_Access (AMF.Holders.Elements.Element (Value)));

         elsif Property = MP_CMOF_Element_Import_Importing_Namespace then
            --  ElementImport::importingNamespace : Namespace

            AMF.CMOF.Element_Imports.CMOF_Element_Import_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Importing_Namespace
               (AMF.CMOF.Namespaces.CMOF_Namespace_Access (AMF.Holders.Elements.Element (Value)));

         elsif Property = MP_CMOF_Element_Import_Visibility then
            --  ElementImport::visibility : VisibilityKind

            AMF.CMOF.Element_Imports.CMOF_Element_Import_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Visibility
               (AMF.CMOF.Holders.Visibility_Kinds.Element (Value));

         else
            raise Program_Error;
         end if;
      end Element_Import_Set;

      ---------------------
      -- Enumeration_Set --
      ---------------------

      procedure Enumeration_Set is
      begin
         if Property = MP_CMOF_Classifier_Is_Final_Specialization then
            --  Classifier::isFinalSpecialization : Boolean

            AMF.CMOF.Enumerations.CMOF_Enumeration_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Is_Final_Specialization
               (League.Holders.Booleans.Element (Value));

         elsif Property = MP_CMOF_Named_Element_Name then
            --  NamedElement::name : String

            AMF.CMOF.Enumerations.CMOF_Enumeration_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Name
               (AMF.Holders.Element (Value));

         elsif Property = MP_CMOF_Type_Package then
            --  Type::package : Package

            AMF.CMOF.Enumerations.CMOF_Enumeration_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Package
               (AMF.CMOF.Packages.CMOF_Package_Access (AMF.Holders.Elements.Element (Value)));

         elsif Property = MP_CMOF_Named_Element_Visibility then
            --  NamedElement::visibility : VisibilityKind

            AMF.CMOF.Enumerations.CMOF_Enumeration_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Visibility
               (AMF.CMOF.Holders.Element (Value));

         else
            raise Program_Error;
         end if;
      end Enumeration_Set;

      -----------------------------
      -- Enumeration_Literal_Set --
      -----------------------------

      procedure Enumeration_Literal_Set is
      begin
         if Property = MP_CMOF_Enumeration_Literal_Enumeration then
            --  EnumerationLiteral::enumeration : Enumeration

            AMF.CMOF.Enumeration_Literals.CMOF_Enumeration_Literal_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Enumeration
               (AMF.CMOF.Enumerations.CMOF_Enumeration_Access (AMF.Holders.Elements.Element (Value)));

         elsif Property = MP_CMOF_Named_Element_Name then
            --  NamedElement::name : String

            AMF.CMOF.Enumeration_Literals.CMOF_Enumeration_Literal_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Name
               (AMF.Holders.Element (Value));

         elsif Property = MP_CMOF_Named_Element_Visibility then
            --  NamedElement::visibility : VisibilityKind

            AMF.CMOF.Enumeration_Literals.CMOF_Enumeration_Literal_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Visibility
               (AMF.CMOF.Holders.Element (Value));

         else
            raise Program_Error;
         end if;
      end Enumeration_Literal_Set;

      --------------------
      -- Expression_Set --
      --------------------

      procedure Expression_Set is
      begin
         if Property = MP_CMOF_Named_Element_Name then
            --  NamedElement::name : String

            AMF.CMOF.Expressions.CMOF_Expression_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Name
               (AMF.Holders.Element (Value));

         elsif Property = MP_CMOF_Typed_Element_Type then
            --  TypedElement::type : Type

            AMF.CMOF.Expressions.CMOF_Expression_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Type
               (AMF.CMOF.Types.CMOF_Type_Access (AMF.Holders.Elements.Element (Value)));

         elsif Property = MP_CMOF_Named_Element_Visibility then
            --  NamedElement::visibility : VisibilityKind

            AMF.CMOF.Expressions.CMOF_Expression_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Visibility
               (AMF.CMOF.Holders.Element (Value));

         else
            raise Program_Error;
         end if;
      end Expression_Set;

      ---------------------------
      -- Opaque_Expression_Set --
      ---------------------------

      procedure Opaque_Expression_Set is
      begin
         if Property = MP_CMOF_Named_Element_Name then
            --  NamedElement::name : String

            AMF.CMOF.Opaque_Expressions.CMOF_Opaque_Expression_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Name
               (AMF.Holders.Element (Value));

         elsif Property = MP_CMOF_Typed_Element_Type then
            --  TypedElement::type : Type

            AMF.CMOF.Opaque_Expressions.CMOF_Opaque_Expression_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Type
               (AMF.CMOF.Types.CMOF_Type_Access (AMF.Holders.Elements.Element (Value)));

         elsif Property = MP_CMOF_Named_Element_Visibility then
            --  NamedElement::visibility : VisibilityKind

            AMF.CMOF.Opaque_Expressions.CMOF_Opaque_Expression_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Visibility
               (AMF.CMOF.Holders.Element (Value));

         else
            raise Program_Error;
         end if;
      end Opaque_Expression_Set;

      -------------------
      -- Operation_Set --
      -------------------

      procedure Operation_Set is
      begin
         if Property = MP_CMOF_Operation_Body_Condition then
            --  Operation::bodyCondition : Constraint

            AMF.CMOF.Operations.CMOF_Operation_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Body_Condition
               (AMF.CMOF.Constraints.CMOF_Constraint_Access (AMF.Holders.Elements.Element (Value)));

         elsif Property = MP_CMOF_Operation_Class then
            --  Operation::class : Class

            AMF.CMOF.Operations.CMOF_Operation_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Class
               (AMF.CMOF.Classes.CMOF_Class_Access (AMF.Holders.Elements.Element (Value)));

         elsif Property = MP_CMOF_Operation_Datatype then
            --  Operation::datatype : DataType

            AMF.CMOF.Operations.CMOF_Operation_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Datatype
               (AMF.CMOF.Data_Types.CMOF_Data_Type_Access (AMF.Holders.Elements.Element (Value)));

         elsif Property = MP_CMOF_Redefinable_Element_Is_Leaf then
            --  RedefinableElement::isLeaf : Boolean

            AMF.CMOF.Operations.CMOF_Operation_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Is_Leaf
               (League.Holders.Booleans.Element (Value));

         elsif Property = MP_CMOF_Operation_Is_Query then
            --  Operation::isQuery : Boolean

            AMF.CMOF.Operations.CMOF_Operation_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Is_Query
               (League.Holders.Booleans.Element (Value));

         elsif Property = MP_CMOF_Named_Element_Name then
            --  NamedElement::name : String

            AMF.CMOF.Operations.CMOF_Operation_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Name
               (AMF.Holders.Element (Value));

         elsif Property = MP_CMOF_Named_Element_Visibility then
            --  NamedElement::visibility : VisibilityKind

            AMF.CMOF.Operations.CMOF_Operation_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Visibility
               (AMF.CMOF.Holders.Element (Value));

         else
            raise Program_Error;
         end if;
      end Operation_Set;

      -----------------
      -- Package_Set --
      -----------------

      procedure Package_Set is
      begin
         if Property = MP_CMOF_Named_Element_Name then
            --  NamedElement::name : String

            AMF.CMOF.Packages.CMOF_Package_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Name
               (AMF.Holders.Element (Value));

         elsif Property = MP_CMOF_Package_Nesting_Package then
            --  Package::nestingPackage : Package

            AMF.CMOF.Packages.CMOF_Package_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Nesting_Package
               (AMF.CMOF.Packages.CMOF_Package_Access (AMF.Holders.Elements.Element (Value)));

         elsif Property = MP_CMOF_Package_Uri then
            --  Package::uri : String

            AMF.CMOF.Packages.CMOF_Package_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Uri
               (AMF.Holders.Element (Value));

         elsif Property = MP_CMOF_Named_Element_Visibility then
            --  NamedElement::visibility : VisibilityKind

            AMF.CMOF.Packages.CMOF_Package_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Visibility
               (AMF.CMOF.Holders.Element (Value));

         else
            raise Program_Error;
         end if;
      end Package_Set;

      ------------------------
      -- Package_Import_Set --
      ------------------------

      procedure Package_Import_Set is
      begin
         if Property = MP_CMOF_Package_Import_Imported_Package then
            --  PackageImport::importedPackage : Package

            AMF.CMOF.Package_Imports.CMOF_Package_Import_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Imported_Package
               (AMF.CMOF.Packages.CMOF_Package_Access (AMF.Holders.Elements.Element (Value)));

         elsif Property = MP_CMOF_Package_Import_Importing_Namespace then
            --  PackageImport::importingNamespace : Namespace

            AMF.CMOF.Package_Imports.CMOF_Package_Import_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Importing_Namespace
               (AMF.CMOF.Namespaces.CMOF_Namespace_Access (AMF.Holders.Elements.Element (Value)));

         elsif Property = MP_CMOF_Package_Import_Visibility then
            --  PackageImport::visibility : VisibilityKind

            AMF.CMOF.Package_Imports.CMOF_Package_Import_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Visibility
               (AMF.CMOF.Holders.Visibility_Kinds.Element (Value));

         else
            raise Program_Error;
         end if;
      end Package_Import_Set;

      -----------------------
      -- Package_Merge_Set --
      -----------------------

      procedure Package_Merge_Set is
      begin
         if Property = MP_CMOF_Package_Merge_Merged_Package then
            --  PackageMerge::mergedPackage : Package

            AMF.CMOF.Package_Merges.CMOF_Package_Merge_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Merged_Package
               (AMF.CMOF.Packages.CMOF_Package_Access (AMF.Holders.Elements.Element (Value)));

         elsif Property = MP_CMOF_Package_Merge_Receiving_Package then
            --  PackageMerge::receivingPackage : Package

            AMF.CMOF.Package_Merges.CMOF_Package_Merge_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Receiving_Package
               (AMF.CMOF.Packages.CMOF_Package_Access (AMF.Holders.Elements.Element (Value)));

         else
            raise Program_Error;
         end if;
      end Package_Merge_Set;

      -------------------
      -- Parameter_Set --
      -------------------

      procedure Parameter_Set is
      begin
         if Property = MP_CMOF_Parameter_Default then
            --  Parameter::default : String

            AMF.CMOF.Parameters.CMOF_Parameter_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Default
               (AMF.Holders.Element (Value));

         elsif Property = MP_CMOF_Parameter_Direction then
            --  Parameter::direction : ParameterDirectionKind

            AMF.CMOF.Parameters.CMOF_Parameter_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Direction
               (AMF.CMOF.Holders.Parameter_Direction_Kinds.Element (Value));

         elsif Property = MP_CMOF_Multiplicity_Element_Is_Ordered then
            --  MultiplicityElement::isOrdered : Boolean

            AMF.CMOF.Parameters.CMOF_Parameter_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Is_Ordered
               (League.Holders.Booleans.Element (Value));

         elsif Property = MP_CMOF_Multiplicity_Element_Is_Unique then
            --  MultiplicityElement::isUnique : Boolean

            AMF.CMOF.Parameters.CMOF_Parameter_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Is_Unique
               (League.Holders.Booleans.Element (Value));

         elsif Property = MP_CMOF_Multiplicity_Element_Lower then
            --  MultiplicityElement::lower : Integer

            AMF.CMOF.Parameters.CMOF_Parameter_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Lower
               (AMF.Holders.Element (Value));

         elsif Property = MP_CMOF_Named_Element_Name then
            --  NamedElement::name : String

            AMF.CMOF.Parameters.CMOF_Parameter_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Name
               (AMF.Holders.Element (Value));

         elsif Property = MP_CMOF_Parameter_Operation then
            --  Parameter::operation : Operation

            AMF.CMOF.Parameters.CMOF_Parameter_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Operation
               (AMF.CMOF.Operations.CMOF_Operation_Access (AMF.Holders.Elements.Element (Value)));

         elsif Property = MP_CMOF_Typed_Element_Type then
            --  TypedElement::type : Type

            AMF.CMOF.Parameters.CMOF_Parameter_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Type
               (AMF.CMOF.Types.CMOF_Type_Access (AMF.Holders.Elements.Element (Value)));

         elsif Property = MP_CMOF_Multiplicity_Element_Upper then
            --  MultiplicityElement::upper : UnlimitedNatural

            AMF.CMOF.Parameters.CMOF_Parameter_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Upper
               (AMF.Holders.Element (Value));

         elsif Property = MP_CMOF_Named_Element_Visibility then
            --  NamedElement::visibility : VisibilityKind

            AMF.CMOF.Parameters.CMOF_Parameter_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Visibility
               (AMF.CMOF.Holders.Element (Value));

         else
            raise Program_Error;
         end if;
      end Parameter_Set;

      ------------------------
      -- Primitive_Type_Set --
      ------------------------

      procedure Primitive_Type_Set is
      begin
         if Property = MP_CMOF_Classifier_Is_Final_Specialization then
            --  Classifier::isFinalSpecialization : Boolean

            AMF.CMOF.Primitive_Types.CMOF_Primitive_Type_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Is_Final_Specialization
               (League.Holders.Booleans.Element (Value));

         elsif Property = MP_CMOF_Named_Element_Name then
            --  NamedElement::name : String

            AMF.CMOF.Primitive_Types.CMOF_Primitive_Type_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Name
               (AMF.Holders.Element (Value));

         elsif Property = MP_CMOF_Type_Package then
            --  Type::package : Package

            AMF.CMOF.Primitive_Types.CMOF_Primitive_Type_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Package
               (AMF.CMOF.Packages.CMOF_Package_Access (AMF.Holders.Elements.Element (Value)));

         elsif Property = MP_CMOF_Named_Element_Visibility then
            --  NamedElement::visibility : VisibilityKind

            AMF.CMOF.Primitive_Types.CMOF_Primitive_Type_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Visibility
               (AMF.CMOF.Holders.Element (Value));

         else
            raise Program_Error;
         end if;
      end Primitive_Type_Set;

      ------------------
      -- Property_Set --
      ------------------

      procedure Property_Set is
      begin
         if Property = MP_CMOF_Property_Association then
            --  Property::association : Association

            AMF.CMOF.Properties.CMOF_Property_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Association
               (AMF.CMOF.Associations.CMOF_Association_Access (AMF.Holders.Elements.Element (Value)));

         elsif Property = MP_CMOF_Property_Class then
            --  Property::class : Class

            AMF.CMOF.Properties.CMOF_Property_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Class
               (AMF.CMOF.Classes.CMOF_Class_Access (AMF.Holders.Elements.Element (Value)));

         elsif Property = MP_CMOF_Property_Datatype then
            --  Property::datatype : DataType

            AMF.CMOF.Properties.CMOF_Property_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Datatype
               (AMF.CMOF.Data_Types.CMOF_Data_Type_Access (AMF.Holders.Elements.Element (Value)));

         elsif Property = MP_CMOF_Property_Default then
            --  Property::default : String

            AMF.CMOF.Properties.CMOF_Property_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Default
               (AMF.Holders.Element (Value));

         elsif Property = MP_CMOF_Property_Is_Composite then
            --  Property::isComposite : Boolean

            AMF.CMOF.Properties.CMOF_Property_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Is_Composite
               (League.Holders.Booleans.Element (Value));

         elsif Property = MP_CMOF_Property_Is_Derived then
            --  Property::isDerived : Boolean

            AMF.CMOF.Properties.CMOF_Property_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Is_Derived
               (League.Holders.Booleans.Element (Value));

         elsif Property = MP_CMOF_Property_Is_Derived_Union then
            --  Property::isDerivedUnion : Boolean

            AMF.CMOF.Properties.CMOF_Property_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Is_Derived_Union
               (League.Holders.Booleans.Element (Value));

         elsif Property = MP_CMOF_Redefinable_Element_Is_Leaf then
            --  RedefinableElement::isLeaf : Boolean

            AMF.CMOF.Properties.CMOF_Property_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Is_Leaf
               (League.Holders.Booleans.Element (Value));

         elsif Property = MP_CMOF_Multiplicity_Element_Is_Ordered then
            --  MultiplicityElement::isOrdered : Boolean

            AMF.CMOF.Properties.CMOF_Property_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Is_Ordered
               (League.Holders.Booleans.Element (Value));

         elsif Property = MP_CMOF_Property_Is_Read_Only then
            --  Property::isReadOnly : Boolean

            AMF.CMOF.Properties.CMOF_Property_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Is_Read_Only
               (League.Holders.Booleans.Element (Value));

         elsif Property = MP_CMOF_Multiplicity_Element_Is_Unique then
            --  MultiplicityElement::isUnique : Boolean

            AMF.CMOF.Properties.CMOF_Property_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Is_Unique
               (League.Holders.Booleans.Element (Value));

         elsif Property = MP_CMOF_Multiplicity_Element_Lower then
            --  MultiplicityElement::lower : Integer

            AMF.CMOF.Properties.CMOF_Property_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Lower
               (AMF.Holders.Element (Value));

         elsif Property = MP_CMOF_Named_Element_Name then
            --  NamedElement::name : String

            AMF.CMOF.Properties.CMOF_Property_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Name
               (AMF.Holders.Element (Value));

         elsif Property = MP_CMOF_Property_Owning_Association then
            --  Property::owningAssociation : Association

            AMF.CMOF.Properties.CMOF_Property_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Owning_Association
               (AMF.CMOF.Associations.CMOF_Association_Access (AMF.Holders.Elements.Element (Value)));

         elsif Property = MP_CMOF_Typed_Element_Type then
            --  TypedElement::type : Type

            AMF.CMOF.Properties.CMOF_Property_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Type
               (AMF.CMOF.Types.CMOF_Type_Access (AMF.Holders.Elements.Element (Value)));

         elsif Property = MP_CMOF_Multiplicity_Element_Upper then
            --  MultiplicityElement::upper : UnlimitedNatural

            AMF.CMOF.Properties.CMOF_Property_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Upper
               (AMF.Holders.Element (Value));

         elsif Property = MP_CMOF_Named_Element_Visibility then
            --  NamedElement::visibility : VisibilityKind

            AMF.CMOF.Properties.CMOF_Property_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Visibility
               (AMF.CMOF.Holders.Element (Value));

         else
            raise Program_Error;
         end if;
      end Property_Set;

      -------------
      -- Tag_Set --
      -------------

      procedure Tag_Set is
      begin
         if Property = MP_CMOF_Tag_Name then
            --  Tag::name : String

            AMF.CMOF.Tags.CMOF_Tag_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Name
               (League.Holders.Element (Value));

         elsif Property = MP_CMOF_Tag_Tag_Owner then
            --  Tag::tagOwner : Element

            AMF.CMOF.Tags.CMOF_Tag_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Tag_Owner
               (AMF.CMOF.Elements.CMOF_Element_Access (AMF.Holders.Elements.Element (Value)));

         elsif Property = MP_CMOF_Tag_Value then
            --  Tag::value : String

            AMF.CMOF.Tags.CMOF_Tag_Access
             (AMF.Internals.Helpers.To_Element (Self)).Set_Value
               (League.Holders.Element (Value));

         else
            raise Program_Error;
         end if;
      end Tag_Set;
   begin
      case CMOF_Element_Table.Table (Self).Kind is
         when E_None =>
            raise Program_Error;

         when E_Association =>
            Association_Set;

         when E_Class =>
            Class_Set;

         when E_Comment =>
            Comment_Set;

         when E_Constraint =>
            Constraint_Set;

         when E_Data_Type =>
            Data_Type_Set;

         when E_Element_Import =>
            Element_Import_Set;

         when E_Enumeration =>
            Enumeration_Set;

         when E_Enumeration_Literal =>
            Enumeration_Literal_Set;

         when E_Expression =>
            Expression_Set;

         when E_Opaque_Expression =>
            Opaque_Expression_Set;

         when E_Operation =>
            Operation_Set;

         when E_Package =>
            Package_Set;

         when E_Package_Import =>
            Package_Import_Set;

         when E_Package_Merge =>
            Package_Merge_Set;

         when E_Parameter =>
            Parameter_Set;

         when E_Primitive_Type =>
            Primitive_Type_Set;

         when E_Property =>
            Property_Set;

         when E_Tag =>
            Tag_Set;
      end case;
   end Set;

end AMF.Internals.Tables.CMOF_Reflection;