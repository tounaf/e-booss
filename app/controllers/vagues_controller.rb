class VaguesController < ApplicationController
  before_action :set_vague, only: [:show, :edit, :update, :destroy]

  # GET /vagues
  # GET /vagues.json
  def index
    @vagues = Vague.all
  end

  # GET /vagues/1
  # GET /vagues/1.json
  def show
  end

  # GET /vagues/new
  def new
    @vague = Vague.new
  end

  # GET /vagues/1/edit
  def edit
  end

  # POST /vagues
  # POST /vagues.json
  def create
    @vague = Vague.new(vague_params)

    respond_to do |format|
      if @vague.save
        format.html { redirect_to @vague, notice: 'Vague was successfully created.' }
        format.json { render :show, status: :created, location: @vague }
      else
        format.html { render :new }
        format.json { render json: @vague.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vagues/1
  # PATCH/PUT /vagues/1.json
  def update
    respond_to do |format|
      if @vague.update(vague_params)
        format.html { redirect_to @vague, notice: 'Vague was successfully updated.' }
        format.json { render :show, status: :ok, location: @vague }
      else
        format.html { render :edit }
        format.json { render json: @vague.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vagues/1
  # DELETE /vagues/1.json
  def destroy
    @vague.destroy
    respond_to do |format|
      format.html { redirect_to vagues_url, notice: 'Vague was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vague
      @vague = Vague.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vague_params
      params.require(:vague).permit(:rentree, :status)
    end
end
