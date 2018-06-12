class FilieresController < ApplicationController
  def index
    @filieres = Filiere.all
  end

  def new
    @filiere = Filiere.new
  end

  def create
    if user_signed_in?
      #chercher la relation etab_responsable
      a=AssociateUserEtab.find_by(user_id: current_user.id)
      #qui est son établissement?
      @e = a.etablissement
      #l'id de cette etablissement est "e.id"

      #enregistrement de filière
      #if filiere existe déjà
      @f = Filiere.find_by(nom: params[:filiere][:nom])
      if @f == nil
        #si la filière en question n'est pas encore existe, on va la créer
        @f = Filiere.new(nom: params[:filiere][:nom], description: params[:filiere][:description])
        if @f.valid?
          #créer association etab_filière de current_user
          @f.save
          afu = AssociateFiliereEtab.new()
          afu.filiere = @f
          afu.etablissement = @e
          afu.save

          flash[:success] = "Création filière avec succès et ajouté dans votre établissement!"
          redirect_to filieres_path
        else
          #errer de création 
          flash[:error] = "Champ invalide!"
          redirect_to new_filiere_path
        end
      else
        #filière dejà existe
          afu = AssociateFiliereEtab.new()
          afu.filiere = @f
          afu.etablissement = @e
          test = false
            #chercher tout les association filière etab de l'établissement en question
            ef = AssociateFiliereEtab.where(etablissement_id:@e.id) #tableau
            ef.each do |assoc|
              if (assoc.filiere == afu.filiere) && (assoc.etablissement == afu.etablissement)
                #relation dejà existe
                test = true
              else
                #créer relation
                test = false
              end
            end
          if test==true
            flash[:error] = "Filiere est déjà dans votre etablissement"
            redirect_to new_filiere_path
          else
            flash[:success] = "La filière est bien inseré dans votre établissement!"
            afu.save
            #tout les filiere de l'etab
            redirect_to associate_filiere_etabs_path
          end
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
