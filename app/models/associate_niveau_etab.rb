class AssociateNiveauEtab < ApplicationRecord
    belongs_to :niveau
    belongs_to :etablissement
end
