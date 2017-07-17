class RoundsController < ApplicationController

  def new
    if session[:round_id]
      redirect_to round_path(@round)
    else
      @round = Round.new
      @round.deck = Deck.find(session[:deck_id])
      if logged_in?
        @round.user = current_user
      else
        @round.user = User.find(1)
      end
      @round.save
      session[:round_id] = @round.id
      redirect_to round_path(@round)
    end
  end

  def show
    if session[:cards].empty?
      redirect_to current_user
    else
      @card = Card.find(session[:cards].first)
      redirect_to @card
    end
  end
end
