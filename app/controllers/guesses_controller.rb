class GuessesController < ApplicationController

  def new
  end

  def create
    @guess = Guess.create(guess_params)
    # if @card.answer.downcase == params[:answer].downcase
    #   @correct = true
    #   session[:cards].delete(@card.id)
    # else
    #   @correct = false
    #   session[:cards].rotate!
    # end
    # erb :'cards/response'
  end

    private
    def guess_params
      params.require(:guess).permit(:card_id, :round_id)
    end
end
