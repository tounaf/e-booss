class FilieresController < ApplicationController
  def index
    @filieres = Filiere.all
  end

  def new
    @filiere = Filiere.new
  end

  def create
    @f = Filiere.new(nom: params[:filiere][:nom], description: params[:filiere][:description])
    if @f.save
      flash[:success] = "Création filière avec succès!"
      redirect_to filieres_path
    else
      flash[:error] = "Champ invalide!"
      redirect_to new_filiere_path
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
