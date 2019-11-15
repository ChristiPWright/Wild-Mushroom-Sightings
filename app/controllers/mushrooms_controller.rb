class MushroomsController < ApplicationController
    def index
        @mushrooms = Mushroom.all
        render json: @mushrooms
    end
    
    def show
        @mushroom = Mushroom.find([params[:id]])
        render json: @mushroom
    end
    
    def create 
        @mushroom = Mushroom.new(mushroom_params) 
        if @mushroom.save
            render json: @mushroom, status: 201
        else
            render json: @mushroom.errors, status: 422
        end
    end
    
    def update
        @mushroom = Mushroom.find(params[:id])
        if @mushroom.update(mushroom_params)
            render json: @mushroom, status: 201
        else
            render json: @mushrooms.errors, status: 422
        end
    end
    
    def destroy
        @mushroom = Mushroom.find(params[:id])
        if @mushroom && @mushroom.destroy
            render json: @mushroom, status: 200
        else
            render json: { errors: "Could not destroy mushroom"}, status: 400
        end    
    end
    
    private
    def mushroom_params 
        params
            .require(:mushroom)
            .permit(:common_name, :species, :genus)
    end
    
end
