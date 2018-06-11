class NiveausupsController < ApplicationController
  def index
    @niv_sup = Niveausup.all
  end

  def show
    @niv_sup = Niveausup.find(params[:id])
  end

  def edit
    @niv_sup = Niveausup.find(params[:id])
  end

  def new
    @niv_sup = Niveausup.new
  end

  def create
    @niv_sup = Niveausup.new(niveau: params[:niveausup][:niveau], nb_place: params[:niveausup][:nb_place].to_i)
    if @niv_sup.save
      flash[:success] = "Création niveau université avec succès"
      redirect_to niveausups_path
    else
      flash[:error] = "Champ invalid !"
      redirect_to new_niveausup_path
    end
  end

  def update
    @niv_sup = Niveausup.find(params[:id])
    niveau_sup_params = params.require(:niveausup).permit(:niveau, :nb_place)
    @niv_sup.update(niveau_sup_params)
    redirect_to niveausups_path
  end

  def destroy
    @niv_sup = Niveausup.find(params[:id])
    @niv_sup.destroy
    redirect_to niveausups_path
  end
end
