class Niveau < ApplicationRecord
    has_many :associate_niveau_etabs
    has_many :etablissement, through: :associate_niveau_etabs
end
