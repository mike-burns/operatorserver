class ContactListsController < ApplicationController
  def update
    @users = User.by_phone_numbers(params[:contacts])
    respond_to do |response|
      response.xml
    end
  end
end
