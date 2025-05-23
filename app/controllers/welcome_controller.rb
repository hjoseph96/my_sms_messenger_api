class WelcomeController < ApplicationController
  def index
    render json: { success: true, message: "Welcome to My SMS Messenger." }
  end
end