class PlantsController < ApplicationController
  include Pagy::Backend

  def index
    pagy, plants = pagy(Plant.all)

    render json: { plant_records: ActiveModel::Serializer::CollectionSerializer.new(
      plants, serializer: PlantSerializer),
      info: {
        page:  pagy.page,
        next:  pagy.next,
        items: pagy.items,
        pagy: pagy_metadata(pagy)
      }
    }
  end


  def show
    plant = Plant.find(params[:id])
    render json: plant
  end


end
