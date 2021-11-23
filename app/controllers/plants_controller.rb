class PlantsController < ApplicationController
  include Pagy::Backend

  def index
    @pagy, plants = pagy(Plant.all)

    render json: { plant_records: plants, pagy: pagy_metadata(@pagy) }
    # render json: plants
  end
  

  def show
    plant = Plant.find(params[:id])
    render json: plant
  end


end
