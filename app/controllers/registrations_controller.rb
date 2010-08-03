class RegistrationsController < ApplicationController
  def create
    User.create(:phone_number => params[:phone_number],
                :registration_identifier => params[:registration_id])
    render :nothing => true
  end
end
