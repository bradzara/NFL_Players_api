class PlayersController < ApplicationController
  def index
    @players = Player.all
    render :index
  end
end
