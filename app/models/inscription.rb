class Inscription < ApplicationRecord
    belongs_to :user
    belongs_to :etablissement
    belongs_to :vague
    belongs_to :filiere
end
