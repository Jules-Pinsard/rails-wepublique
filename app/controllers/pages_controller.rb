class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home]

  def home
    @markers = Observation.all.geocoded.map do |observation|
      {
        lat: observation.latitude,
        lng: observation.longitude
      }
    end
    mayor = User.where(mayor: true)
    @mayor_mesures = Mesure.where(user: mayor)
    @mesures = Comment.last(10).map(&:mesure)
    @mesures_retenues = Mesure.where(status: "Validé")
  end

end
