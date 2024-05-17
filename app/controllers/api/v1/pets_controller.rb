class Api::V1::PetsController < ApplicationController
  before_action :set_api_v1_pet, only: %i[ show edit update destroy ]

  # GET /api/v1/pets or /api/v1/pets.json
  def index
    @api_v1_pets = Api::V1::Pet.all
  end

  # GET /api/v1/pets/1 or /api/v1/pets/1.json
  def show
  end

  # GET /api/v1/pets/new
  def new
    @api_v1_pet = Api::V1::Pet.new
  end

  # GET /api/v1/pets/1/edit
  def edit
  end

  # POST /api/v1/pets or /api/v1/pets.json
  def create
    @api_v1_pet = Api::V1::Pet.new(api_v1_pet_params)

    respond_to do |format|
      if @api_v1_pet.save
        format.html { redirect_to api_v1_pet_url(@api_v1_pet), notice: "Pet was successfully created." }
        format.json { render :show, status: :created, location: @api_v1_pet }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @api_v1_pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/v1/pets/1 or /api/v1/pets/1.json
  def update
    respond_to do |format|
      if @api_v1_pet.update(api_v1_pet_params)
        format.html { redirect_to api_v1_pet_url(@api_v1_pet), notice: "Pet was successfully updated." }
        format.json { render :show, status: :ok, location: @api_v1_pet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @api_v1_pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/v1/pets/1 or /api/v1/pets/1.json
  def destroy
    @api_v1_pet.destroy!

    respond_to do |format|
      format.html { redirect_to api_v1_pets_url, notice: "Pet was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_pet
      @api_v1_pet = Api::V1::Pet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_pet_params
      params.fetch(:api_v1_pet, {})
    end
end
