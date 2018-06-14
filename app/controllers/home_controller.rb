class HomeController < ApplicationController
	def index
		@etablissements=Etablissement.page(1).per(6)
		UserMailer.welcome_email(nil).deliver_now
	end
end
