class MushroomsController < ApplicationController
    def index
        @mushrooms = Mushroom.all
        render json: @animals
    end
end
