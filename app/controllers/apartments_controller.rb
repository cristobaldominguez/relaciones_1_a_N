class ApartmentsController < ApplicationController
    def index
        @apartments = Apartment.all
    end
end
