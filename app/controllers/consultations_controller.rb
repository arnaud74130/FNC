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

class ConsultationsController < ApplicationController
  before_action :set_consultation, only: [:show, :edit, :update, :destroy]
  autocomplete :fournisseur, :nom

  def add_marche
    respond_to do |format|
      format.js
    end
  end

  def index
    @consultations = Consultation.all
  end

  def show
  end

  def new
    @consultation = Consultation.new
    @consultation.markets.first_or_initialize  
    @etablissements=Etablissement.all  
  end

  def edit
  end

  def create

    @consultation = Consultation.new(consultation_params)
    respond_to do |format|
      if @consultation.save
       format.html { redirect_to @consultation, notice: 'Consultation was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end
  def update
    respond_to do |format|
      if @consultation.update(consultation_params)
        format.html { redirect_to @consultation, notice: 'Consultation was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end
  def destroy
    @consultation.destroy
    respond_to do |format|
      format.html { redirect_to consultations_url, notice: 'Consultation was successfully destroyed.' }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_consultation
    @consultation = Consultation.find(params[:id])
    @etablissements=Etablissement.all
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def consultation_params   
    params.require(:consultation).permit(:code, :libelle, :debut, :fin,:etablissement_ids => [], :markets_attributes => [:id, :code, :fournisseur, :_destroy])
  end  
end
