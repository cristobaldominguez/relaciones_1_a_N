class ApartmentsController < ApplicationController
    def index
        @apartments = Apartment.all
    end

    def show
        @apartment = Apartment.find(params[:id])
    end

    def new
        @apartment = Apartment.new
        @building = Building.new
        @buildings = Building.pluck(:name, :id)
    end

    def create
        @apartment = Apartment.new(apartment_params)
        
        respond_to do |format| 
            if @apartment.save
                format.html { redirect_to @apartment, notice: 'Apartment was successfully created.'}
            else
                format.html { render :new }
            end
        end
    end

    private

    def apartment_params
        params.require(:apartment).permit(:number, :building_id)
    end
end
