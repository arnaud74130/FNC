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

require 'role_model'
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :omniauthable, :registerable
  devise :database_authenticatable, :recoverable, :registerable,
    :rememberable, :trackable, :validatable
  
  belongs_to :entreprise, polymorphic: true

  include RoleModel

  # if you want to use a different integer attribute to store the
  # roles in, set it with roles_attribute :my_roles_attribute,
  # :roles_mask is the default name
  # roles_attribute :roles_mask

  # declare the valid roles -- do not change the order if you add more
  # roles later, always append them at the end!
  roles :grc, :client, :fournisseur
  def entreprise_nom
    self.entreprise.nom if self.entreprise
  end

  def role
    self.roles.first.to_s if self.roles
  end

  def role=(new_role)
    puts "====> ADD NEW ROLE #{new_role}"
    self.roles = [new_role.to_sym]
  end
end
