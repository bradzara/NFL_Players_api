class PlayersController < ApplicationController
  def index
    @players = Player.all
    render :index
  end

  def show
    @player = Player.find_by(id: params[:id])
    render :show
  end

  def create
    @player = Player.create(
      name: params[:name],
      team: params[:team],
      position: params[:position]
    )
    render :show
  end

  def update
    @player = Player.find_by(id: params[:id])
    @player.update(
      name: params[:name] || @player.name,
      team: params[:team] || @player.team,
      position: params[:position] || @player.position
    )
    render :show
  end

  def destroy
    @player = Player.find_by(id: params[:id])
    @player.destroy
    render json: { message: "Player successfully deleted"}
  end
end
