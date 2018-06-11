class AssociateUserEtab < ApplicationRecord
    belongs_to :user
    belongs_to :etablissement
end
