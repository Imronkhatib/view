class SceneriesController < ApplicationController

  def index
    sceneries = Scenery.all
    render json:  sceneries.as_json
  end

  def create
    sceneries = Scenery.new(
      {
        name: params[:name],
        location: params[:location],
        image_url: params[:image_url]
      }
    )

    sceneries.save
  end

  def update
    input_id = params[:id]
    scenery = Scenery.find_by(id:input_id).update(
      {
        name: params[:name],
        location: params[:location],
        image_url: params[:image_url]
      }
    )
  end

  def delete
    input_id = params[:id]
    scenery = Scenery.find_by(id:input_id)
    scenery.destroy
  end
end
