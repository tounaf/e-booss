class EtablissementsController < ApplicationController
  before_action :get_id, only: [:show, :update]

  def index
    @etablissements = Etablissement.page(params[:page]).per(8)
  end

  def show
    
  end

  def new
    @etablissement = Etablissement.new
  end

  def create
    @etablissement = Etablissement.new(etablissement_params)
    @etablissement.image_etablissement = params[:etablissement][:image_etablissement]
    if @etablissement.save
      redirect_to etablissements_path
    else
      redirect_to etablissements_path
    end
  end

  def update
  end

  def delete
  end


  def likes
    @etablissement = Etablissement.find(params[:id])
    if @etablissement.liked_by?(current_user)
      current_user.unlike!(@etablissement)
      @etablissement.likers_count -= 1
      @etablissement.save
      redirect_to @etablissement
    else
      current_user.like!(@etablissement)
      current_user.likees_count += 1
      @etablissement.likers_count += 1
      current_user.save
      @etablissement.save
      redirect_to @etablissement
    end
  end

  private

  def etablissement_params
    params.require(:etablissement).permit(:nom, :mail, :telephone, :adress, :description, :category, :longitude, :latitude, :dossier_a_fournir, :image_etablissement)
  end

  def get_id
    @etablissement = Etablissement.find(params[:id])
  end



end
