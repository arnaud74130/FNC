#     EPSILIM - EPSILIM - Gestion des fiches de non conformité
#     Copyright (C) 2014  Arnaud GARCIA - GCS EPSILIM
#
#     This program is free software: you can redistribute it and/or modify
#     it under the terms of the GNU General Public License as published by
#     the Free Software Foundation, either version 3 of the License, or
#     (at your option) any later version.

#     This program is distributed in the hope that it will be useful,
#     but WITHOUT ANY WARRANTY; without even the implied warranty of
#     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#     GNU General Public License for more details.

#     You should have received a copy of the GNU General Public License
#     along with this program.  If not, see <http://www.gnu.org/licenses/>.

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities

# if user.role? :super_admin
#       can :manage, :all
#     elsif user.role? :product_admin
#       can :manage, [Product, Asset, Issue]
#     elsif user.role? :product_team
#       can :read, [Product, Asset]
#       # manage products, assets he owns
#       can :manage, Product do |product|
#         product.try(:owner) == user
#       end
#       can :manage, Asset do |asset|
#         asset.assetable.try(:owner) == user
#       end
#     end
#   end
   

    user ||= User.new

    if user.has_role? :grc
      can :manage, :all
      #.....
    end

    if user.has_role? :client
      can :read, Etablissement
      can :read, Fournisseur
      can :read, Consultation
      
      #can :manage, Consultation, :etablissement_idSSS => user.etablissement_id
      # utiliser plutot un bloc afin de tester tous les établissements rattachés
    end
   if user.has_role? :fournisseur
      can :read, Etablissement
      can :read, Fournisseur
      can :read, Consultation
      
      #can :manage, Consultation, :etablissement_idSSS => user.etablissement_id
      # utiliser plutot un bloc afin de tester tous les établissements rattachés
    end
  end
end
