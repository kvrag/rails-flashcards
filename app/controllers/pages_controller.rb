class PagesController < ApplicationController

  def index
  end

  def session_helper
    @uniqueword22 = session.inspect
  end
end
