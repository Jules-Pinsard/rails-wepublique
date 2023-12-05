class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home]

  def home
    @markers = Observation.all.includes(:category).geocoded.map do |observation|
      color = "#E97777" if ["Environnement","Santé","Finances"].include?(observation.category.name)
      color = "#96B6C5" if ["Solidarité", "Sport", "Inclusion", "Jeunesse"].include?(observation.category.name)
      color = "#C7DCA7" if ["Culture" || "Patrimoine" || "Inclusion" || "Jeunesse"].include?(observation.category.name)
      color = "#F9F3CC" if observation.category.name == "Autre"
      {
        color: color,
        lat: observation.latitude,
        lng: observation.longitude,
        info_window_html: render_to_string(partial: "shared/observation_window", locals: {observation: observation})
      }
    end
    @mayor_mesures = Mesure.joins(:user).where("user.mayor": true).last(10)
    @mesures = Mesure.where(status: "En cours de concertation").last(10)
    # @mesures = Comment.joins(:mesure).where("mesure.status": "En cours de concertation").last(10).map(&:mesure)
    @mesures_retenues = Mesure.where(status: "Validé").last(10)
  end

  def category
    category = Category.find(params[:id])
    @mesures = category.mesures
    respond_to :json
  end

end
