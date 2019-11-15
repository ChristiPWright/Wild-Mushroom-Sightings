class SightingsController < ApplicationController
    def index
        @sightings = Sighting.all
        render json: @sightings
    end
    
    def show
        @sighting = Sighting.find([params[:id]])
        render json: @sighting
    end
    
    def create 
        @sighting = Sighting.new(sighting_params) 
        if @sighting.save
            render json: @sighting, status: 201
        else
            render json: @sighting.errors, status: 422
        end
    end
    
    def update
        @sighting = Sighting.find(params[:id])
        if @sighting.update(sighting_params)
            render json: @sighting, status: 201
        else
            render json: @sightings.errors, status: 422
        end
    end
    
    def destroy
        @sighting = Sighting.find(params[:id])
        if @sighting && @sighting.destroy
            render json: @sighting, status: 200
        else
            render json: { errors: "Could not destroy mushroom"}, status: 400
        end    
    end
    
    private
    def sighting_params 
        params
            .require(:sighting)
            .permit(:mushroom_id, :date, :latitude, :longitude)
    end
end
