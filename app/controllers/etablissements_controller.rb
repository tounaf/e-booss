class EtablissementsController < ApplicationController
  before_action :get_id, only: [:show, :update]

  def index
    @etablissements = Etablissement.page(params[:page]).per(5)
  end

  def show
    @etablissement = Etablissement.find(params[:id])   
  end

  def new
    @etablissement = Etablissement.new
  end

  def create
    # en tant que responsable = CREER SON ETABLISSEMENT
    # ceci est un test
    
    test = false
    if user_signed_in?
      # chercher si la personne en question a déjà un établissement

      @a = AssociateUserEtab.all
      @a.each do |assoc|
        if assoc.user == current_user
          # la personne a déjà un étab /  rédiriger vers son établissement
          test = true
        end
      end
      if test==false
        # la personne peut créer son étab
        @etablissement = Etablissement.new(etablissement_params)
        if @etablissement.save
          redirect_to etablissements_path
        else
          redirect_to etablissements_path
        end
      end
    else
      flash[:error] = "Sign in please!"
      redirect_to user_session_path
    end
    
  end

  def update
  end

  def delete
  end

  private

  def etablissement_params
    params.require(:etablissement).permit(:nom, :mail, :telephone, :adress, :description, :category, :longitude, :latitude, :dossier_a_fournir, :image_etablissement)
  end

  def get_id
    @etablissement = Etablissement.find(params[:id])
  end
end
