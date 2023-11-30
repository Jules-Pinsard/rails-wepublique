class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home]

  def home
    @markers = Observation.all.geocoded.map do |observation|
      {
        lat: observation.latitude,
        lng: observation.longitude,
        info_window_html: render_to_string(partial: "shared/observation_window", locals: {observation: observation})
      }
    end
    mayor = User.where(mayor: true)
    @mayor_mesures = Mesure.where(user: mayor)
    @mesures = Comment.last(10).map(&:mesure)
    @mesures_retenues = Mesure.where(status: "Validé")
  end

  def category
    category = Category.find(params[:id])
    @mesures = category.mesures
    respond_to :json
  end

end
