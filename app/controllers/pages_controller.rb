class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home]

  def home
    @markers = Observation.all.includes(:category).includes(:user).geocoded.map do |observation|
      color = "#B31A1A" if ["Environnement","Santé","Finances"].include?(observation.category.name)
      color = "#1343A9" if ["Solidarité", "Sport", "Inclusion", "Jeunesse"].include?(observation.category.name)
      color = "#317232" if ["Culture", "Patrimoine", "Tourisme", "Mobilier"].include?(observation.category.name)
      color = "#F9F3CC" if observation.category.name == "Autre"
      {
        color: color,
        lat: observation.latitude,
        lng: observation.longitude,
        info_window_html: render_to_string(partial: "shared/observation_window", locals: {observation: observation})
      }
    end
    @mayor_mesures = Mesure.joins(:user).where("user.mayor": true).order(created_at: :desc).order(created_at: :desc).first(4)
    @mesures = Mesure.where(status: "En cours de concertation").order(created_at: :desc).first(4)
    @mesures_retenues = Mesure.where(status: "Validé").order(created_at: :desc).first(4)
  end

  def category
    category = Category.find(params[:id])
    @mesures = category.mesures
    respond_to :json
  end

end
