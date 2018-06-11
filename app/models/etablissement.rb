class Etablissement < ApplicationRecord
    has_many :associate_user_etabs
    has_many :user, through: :associate_user_etabs
    has_attached_file :dossier_a_fournir
    validates_attachment :dossier_a_fournir, presence: true, content_type: { content_type: "application/pdf" }

    has_many :associate_filiere_etabs
    has_many :filiere, through: :associate_filiere_etabs

    has_many :associate_niveau_etabs
    has_many :niveau, through: :associate_niveau_etabs

    has_many :articles
end
