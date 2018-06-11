class Niveausup < ApplicationRecord
    has_many :niveausup_filieres
    has_many :filiere, through: :niveausup_filieres
end
