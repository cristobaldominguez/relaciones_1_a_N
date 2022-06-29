class ApartmentsController < ApplicationController
  before_action :set_building, except: %i[ destroy ]
  before_action :set_apartment, only: %i[ show edit update destroy ]

  # GET buildings/1/apartments or /apartments.json
  def index
    @apartments = @building.apartments
  end

  # GET buildings/1/apartments/1 or /apartments/1.json
  def show
  end

  # GET buildings/1/apartments/new
  def new
    @apartment = Apartment.new
  end

  # POST buildings/1/apartments or /apartments.json
  def create
    # @apartment = Apartment.new(apartment_params.merge(building: @building))
    @apartment = Apartment.new(apartment_params)
    @apartment.building = @building

    respond_to do |format|
      if @apartment.save
        format.html { redirect_to building_url(@building), notice: "Apartment was successfully created." }
        format.json { render :show, status: :created, location: @apartment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @apartment.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET buildings/1/apartments/1/edit
  def edit
  end

  # PATCH/PUT buildings/1/apartments/1 or /apartments/1.json
  def update
    respond_to do |format|
      if @apartment.update(apartment_params)
        format.html { redirect_to building_url(@building), notice: "Apartment was successfully updated." }
        format.json { render :show, status: :ok, location: @apartment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @apartment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE buildings/1/apartments/1 or /apartments/1.json
  def destroy
    @apartment.destroy

    respond_to do |format|
      format.html { redirect_to building_url(@building), notice: "Apartment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_apartment
      @apartment = Apartment.find(params[:id])
    end

    def set_building
      @building = Building.find(params[:building_id])
    end

    # Only allow a list of trusted parameters through.
    def apartment_params
      params.require(:apartment).permit(:number)
    end
end
