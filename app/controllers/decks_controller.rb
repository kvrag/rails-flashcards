class DecksController < ApplicationController
  def index

  end

  def show
    session[:round_id] = nil
    session[:deck_id] = params[:id]
    redirect_to new_round_path
  end
end
