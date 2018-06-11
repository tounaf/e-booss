class NiveausController < ApplicationController
  def index
    @niveaux = Niveau.all
  end

  def show
    @niveau = Niveau.find(params[:id])
  end

  def edit
    @niveau = Niveau.find(params[:id])
  end

  def new
    @niveau = Niveau.new
  end

  def create
    @niveau = Niveau.new(niveau: params[:niveau][:niveau], place: params[:niveau][:place].to_i)
    if @niveau.save
      flash[:success] = "Création niveau avec succès"
      redirect_to niveaus_path
    else
      flash[:error] = "Champ invalid !"
      redirect_to new_niveau_path
    end
  end

  def update
    @niveau = Niveau.find(params[:id])
    niveau_params = params.require(:niveau).permit(:niveau, :place)
    @niveau.update(niveau_params)
    redirect_to niveaus_path
  end

  def destroy
    @niveau = Niveau.find(params[:id])
    @niveau.destroy
    redirect_to niveaus_path
  end
end
