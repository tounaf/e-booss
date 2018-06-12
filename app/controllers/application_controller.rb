class ApplicationController < ActionController::Base
	attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
	before_action :configure_params_permit, if: :devise_controller?
	after_action :crop_image,only: [:update], if: :devise_controller?
	protected
	def configure_params_permit
		devise_parameter_sanitizer.permit(:sign_up, keys: [:nom, :prenom, :sexe, :date_de_naissance, :adresse, :telephone, :image])
		devise_parameter_sanitizer.permit(:account_update, keys: [:nom, :prenom, :sexe, :date_de_naissance, :adresse, :telephone, :image])

	end

	def crop_image
		image.recreate_versions! if crop_x.present?
	end
end
