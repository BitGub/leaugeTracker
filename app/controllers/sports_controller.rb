class SportsController < ApplicationController
  before_action :signed_in_user, execpt: [:show]
  
  def index
  end
  
  def new
    @sport = Sport.new
  end
  
  def create
    @sport = Sport.new(sport_params)
    @sport.user_id = current_user.id
    if @sport.save
      flash[:success] = "You have now created your sport!"
      redirect_to @sport
    else
      render 'new'
    end
  end
  
  def show
    @sport = Sport.find(params[:id])
  end
  
  def edit
    @sport = Sport.find(params[:id])
  end
  
  def update
    @sport = Sport.find(params[:id])
    if @sport.update_attributes(sport_params)
      flash[:success] = "Sport Information successfully updated!"
      redirect_to @sport
    else
      render 'edit'
    end
  end
  
  private
  
    def sport_params
      params.require(:sport).permit(:name, :description, :user_id)
    end
end