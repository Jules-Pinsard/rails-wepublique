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
    @mayor_mesure = Mesure.where(user: mayor)
    @mesures_discussed = Comment.last(10).map(&:mesure)
    @retenues = Mesure.where(status: "Validé")
  end

end
