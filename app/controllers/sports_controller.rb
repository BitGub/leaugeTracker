class SportsController < ApplicationController
  
  def index
  end
  
  def new
    @sport = Sport.new
  end
  
  def create
    @sport = Sport.new(sport_params)
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
  
  private
  
    def sport_params
      params.require(:sport).permit(:name, :description, :user_id)
    end
end