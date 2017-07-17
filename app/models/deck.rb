class Deck < ApplicationRecord
  has_many :cards
  has_many :rounds

  validates :name, presence: true

  def last_round
    {
    at: self.rounds.last.created_at.in_time_zone("America/Chicago").strftime("%m/%d/%Y at %I:%M %p"),
    correct: self.rounds.last.correct_guesses,
    guesses: self.rounds.last.guesses.count
    }
  end
end
