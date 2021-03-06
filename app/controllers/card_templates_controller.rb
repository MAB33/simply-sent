class CardTemplatesController < ApplicationController
  def index
  	@card_templates = CardTemplate.all
  end

  def show
  	@card_template = CardTemplate.find(params[:id])
  end

  # if no user is logged in when they try to personlize a card, redirect to login pg
	def login_to_personalize
    redirect_to new_user_session_path
    flash[:alert] = "Please log in or sign up to personalize cards."
	end

end
