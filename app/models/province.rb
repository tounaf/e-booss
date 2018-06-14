class Province < ApplicationRecord
    has_many :etablissements
    validates :nom, presence: true
    validates :nom, uniqueness: true
end
