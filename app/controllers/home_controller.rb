class HomeController < ApplicationController
	def index
		UserMailer.welcome_email('harinjatovo.fetra@gmail.com').deliver_now
	end
end
