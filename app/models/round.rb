class Round < ApplicationRecord
  belongs_to :user
  belongs_to :deck
  has_many :guesses

  def correct_guesses
    guesses_by_card = self.guesses.group_by{ |guess| guess.card_id }
    guesses_by_card.select { |card| guesses_by_card[card].length == 1 }.length
  end

  def total_guesses
    self.guesses.count
  end

  def when_played
    self.updated_at.localtime
  end

  def card_arr
    self.deck.cards
  end
end
