class RoundsController < ApplicationController

  def new
    @round = Round.new
    @round.deck = Deck.find(session[:deck_id])
    if logged_in?
      @round.user = current_user
    else
      @round.user = User.find(1)
    end
    @round.save
    session[:round_id] = @round.id
    @card = @round.card_arr.first
    redirect_to deck_card_path(session[:deck_id], @card)
  end

  # def show
  #   @round = Round.find(session[:round_id])
  #   if @round.card_arr.empty?
  #     redirect_to current_user
  #   else
  #     @card = Card.find(@round.card_arr.first)
  #     render 'cards#show'
  #   end
  # end
end
