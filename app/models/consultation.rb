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

class Consultation < ActiveRecord::Base
	has_and_belongs_to_many :etablissements	
	before_destroy {|consultation| consultation.etablissements.clear}
	has_many :markets, :dependent => :delete_all
	

	accepts_nested_attributes_for :markets, allow_destroy: true

	validates_presence_of :code
end
