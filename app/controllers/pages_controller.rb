class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home]

  def home
    # @markers = Observation.all.geocoded.map do |flat|
    #   {
    #     lat: flat.latitude,
    #     lng: flat.longitude
    #   }
    # end
  end

  def update_user
    raise
  end
end
