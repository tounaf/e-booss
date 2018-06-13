class EtablissementsController < ApplicationController
  before_action :get_id, only: [:show, :update]

  def index
    @etablissements = Etablissement.page(params[:page]).per(5)
  end

  def show
    @etablissement = Etablissement.find(params[:id])   
  end

  def new
    if user_signed_in?
      if session[:responsable] != nil
        if session[:etab_id] == nil
        @etablissement = Etablissement.new
        else
          flash[:error] = "Vous avez déjà votre établissement!"
          redirect_to etablissement_path(session[:etab_id])
        end
      else
        flash[:error] = "Vous n'êtes pas un responsable!"
        redirect_to etablissements_path
      end
    else
      flash[:error] = "Sign in please!"
      redirect_to user_session_path      
    end
  end

  def create
    # en tant que responsable = CREER SON ETABLISSEMENT
    test = false
    if user_signed_in?
      # si la personne est RESPONSABLE
      if session[:responsable] != nil
        # si le responsable n'a pas un établissement
        if session[:etab_id] == nil
          # la personne peut créer son étab
          @etablissement = Etablissement.new(etablissement_params)
          @etablissement.responsable_id = current_user.id  # qui est le responsable de cet établissement
          if @etablissement.save
            session[:etab_id] =  @etablissement.id
            # créer association 
            @a = AssociateUserEtab.new()
            @a.etablissement = @etablissement
            @a.user = current_user
            @a.save

            flash[:success] = "Félicitation! Votre établissement est bien créé!"

            redirect_to etablissement_path(@etablissement.id)
          else
            flash[:error] = "Erreur de création!"
            redirect_to new_etablissement_path
          end
        else
          #rediriger vers son établissement
          flash[:error] = "Vous avez déjà un établissement!"
          redirect_to etablissement_path(session[:etab_id])
        end
      else
          #la personne n'est pas responsable
          redirect etablissements_path
        end
      else
        #login obligatoire
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
