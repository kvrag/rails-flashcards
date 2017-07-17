class DecksController < ApplicationController
  def index

  end

  def show
    if session[:round_id] && session[:deck_id] == params[:id]
      redirect_to round_path(@round)
    else
      session[:round_id] = nil
      session[:cards] = Deck.find(params[:id]).cards.map { |card| card.id }
      session[:cards].shuffle!
      session[:deck_id] = params[:id]
      redirect_to new_round_path
    end
  end
end
