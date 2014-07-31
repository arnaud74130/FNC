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


module HtmlHelper
  def link_button(path, default_options={}, options={}, btn_class_name)
    options=options.reverse_merge(default_options)
    link_to t('.#{btn_class_name}', :default => t("helpers.links.#{btn_class_name}")), path, options
  end
  
  def back(path, options = {})
    link_button(path, {:class => 'btn btn-default'}, options, "back")
  end

  def new(path, options={})
    link_button(path, {:class => 'btn btn-primary btn-lg'}, options, "new_html")
  end

  def cancel(path, options={})
    link_button(path, {:class => 'btn btn-default'}, options, "cancel")
  end

  def destroy (path, options = {})
    default_options = {:method => :delete,
                       :data => { :confirm => t('.confirm', :default => t("helpers.links.confirm", :default => 'Are you sure?')) },
                       :class => 'btn btn-danger btn-lg btn-block' }
    link_button(path, default_options, options, "destroy")
  end
  def edit_small(path, options={})
    link_button(path, {:class => 'btn btn-warning btn-small'}, options, "edit")
  end
end
