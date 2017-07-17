class Card < ApplicationRecord
  belongs_to :deck
  belongs_to :guess

  validates :question, :answer, presence: true
end
