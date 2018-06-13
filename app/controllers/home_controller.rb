class HomeController < ApplicationController
	def index
		UserMailer.welcome_email(nil).deliver_now
	end
end
