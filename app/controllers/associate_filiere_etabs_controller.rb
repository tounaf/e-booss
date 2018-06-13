class AssociateFiliereEtabsController < ApplicationController
    def index
            if user_signed_in?
              #a=AssociateUserEtab.find_by(user_id: current_user.id)
              #@e = a.etablissement
              @f_etab = AssociateFiliereEtab.where(etablissement_id: session[:etab_id])
            else
                redirect_to user_session_path
            end
    end

    def new
        #@assoc = AssociateFiliereEtab.new
    end

    def create
            
    end

    def destroy
        @f_etab = AssociateFiliereEtab.find(params[:id])
        @f_etab.destroy
        redirect_to associate_filiere_etabs_path
    end
end
