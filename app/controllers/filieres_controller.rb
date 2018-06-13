class FilieresController < ApplicationController
  def index
    @filieres = Filiere.all
  end

  def new
    @filiere = Filiere.new
  end

  def create
    if user_signed_in?
      #if responsable
      if session[:responsable] != nil
        #if son etablissement exist
        if session[:etab_id] != nil
          @f = Filiere.find_by(nom: params[:filiere][:nom])
          #if filiere n'existe pas
          if @f == nil
            @f = Filiere.new(nom: params[:filiere][:nom], description: params[:filiere][:description], niveau: params[:filiere][:niveau] , place: params[:filiere][:place].to_i)
            if @f.valid?
              @f.save
              #--------------
              #créer association etab_filière de current_user
              #mais dabord verifie si la relation existe déjà
              @a = AssociateFiliereEtab.all
              couple =false
              @a.each do |assoc|
                if assoc.filiere.nom == @f.nom && assoc.etablissement == Etablissement.find(session[:etab_id]) && assoc.filiere.niveau == params[:filiere][:niveau]
                  # couple déjà existé
                  couple = true
                end
              end

              # couple déjà existé
              if couple 
                flash[:error] = "Données déjà existés!"
                redirect_to associate_filiere_etabs_path
              else
                  afu = AssociateFiliereEtab.new()
                  afu.filiere = @f
                  afu.etablissement = Etablissement.find(session[:etab_id])
                  if afu.save
                    flash[:error] = "Enregistrement filière avec niveau réussi dans votre étab!"
                    redirect_to associate_filiere_etabs_path
                  else
                    #puts @f
                    #puts Etablissement.find(session[:etab_id])
                    flash[:error] = "Erreur d'enregistrement filière avec niveau!"
                    redirect_to new_filiere_path
                  end
                    
              end
              #---------------
              #recuperer la valeur de cette filiere
              #flash[:error] = "Enregistrement filière avec niveau réussi dans votre étab!"
              #redirect_to associate_filiere_etabs_path
            #enregistrement filiere invalide
            else
              flash[:error] = "Erreur d'enregistrement filiere!"
              redirect_to new_filiere_path
            end
          #filiere existe déjà
          else
            #-----------------------
            #créer association etab_filière de current_user
              #mais dabord verifie si la relation existe déjà
              @a = AssociateFiliereEtab.all
              couple =false
              @a.each do |assoc|
                if assoc.filiere.nom == @f.nom && assoc.etablissement == Etablissement.find(session[:etab_id]) && assoc.filiere.niveau == params[:filiere][:niveau]
                  # couple déjà existé
                  couple = true
                end
              end

              # couple déjà existé
              if couple == true
                flash[:error] = "Données déjà existés!"
                redirect_to associate_filiere_etabs_path
              else
                  afu = AssociateFiliereEtab.new
                  afu.filiere = @f
                  afu.etablissement = Etablissement.find(session[:etab_id])
                  if afu.save
                    flash[:error] = "Enregistrement filière avec niveau réussi dans votre étab (OPTION filiere dejà existe)!"
                    redirect_to associate_filiere_etabs_path
                  else
                    flash[:error] = "Erreur d'enregistrement filière avec niveau!"
                    redirect_to new_filiere_path
                  end
                    
              end
            #-----------------------
          end
        #la personne n'as pas encore un établissement
        else
          flash[:error] = "Créez dabord votre établissement!"
          redirect_to new_etablissement_path  
        end
      #if not responsable
      else 
        flash[:error] = "Vous n'avez pas le droit de faire ça!"
        redirect_to filieres_path
      end
        
    else
    # pas connecté
      redirect_to user_session_path
    end
    
  end


  def show
  end

  def edit
    @filiere = Filiere.find(params[:id])
  end

  def update
    @filiere = Filiere.find(params[:id])
    filiere_params = params.require(:filiere).permit(:nom, :description)
    @filiere.update(filiere_params)
    redirect_to filieres_path
  end

  def destroy
    @filiere = Filiere.find(params[:id])
    @filiere.destroy
    redirect_to filieres_path
  end
end
