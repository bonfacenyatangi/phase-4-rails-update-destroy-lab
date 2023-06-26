class PlantsController < ApplicationController

  # GET /plants
  def index
    plants = Plant.all
    render json: plants
  end

  # GET /plants/:id
  def show
    plant = Plant.find_by(id: params[:id])
    render json: plant
  end

  # POST /plants
  def create
    plant = Plant.create(plant_params)
    render json: plant, status: :created
  end

  def update
    bird = Plant.find_by(id: params[:id])
    if bird 
      bird.update(plant_params)
      render json: bird
    else
      render json: {error: "Couldn't find plant"}, status: :not_found
    end
  end

  def destroy
    plant = Plant.find_by(id: params[:id])
    if plant
      plant.destroy
      head :no_content
    else
      render json: { error:  "plant was not found "}, status: :not_found
    end
  end

  private

  def plant_params
    params.permit(:name, :image, :price, :is_in_stock)
  end
end
