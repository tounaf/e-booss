class Vague < ApplicationRecord
    
  has_many :inscriptions
  has_many :user, through: :inscriptions

end
