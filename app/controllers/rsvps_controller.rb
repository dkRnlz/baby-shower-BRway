# app/controllers/rsvps_controller.rb
class RsvpsController < ApplicationController
  protect_from_forgery with: :null_session  # se for API-like; ou deixe o padrão e envie o CSRF-Token

  def create
    @rsvp = Rsvp.new(rsvp_params)
    if @rsvp.save
      render json: { status: 'ok' }, status: :created
    else
      render json: { errors: @rsvp.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def rsvp_params
    params.require(:rsvp).permit(
      :name,
      :phone,
      guests_attributes: [:id, :name, :_destroy]
    )
  end
end
