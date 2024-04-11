class RidersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    if params[:search] != nil && params[*:search] != ''
       search = params[:search]
       @riders = Rider.joins(:user).where("name LIKE ?", "%#{search}%")
    else
       @riders = Rider.all
      end
  end
  def new
    @riders = Rider.new
  end
    
  def create
    rider = Rider.new(rider_params)
    rider.user_id = current_user.id
  if rider.save!
    redirect_to :action => "index"
  else
    redirect_to :action => "new"
  end
end

  def show
    @rider = Rider.find(params[:id])
    @comments = @rider.comments
       @comment = Comment.new
   end
    
    
  private
    def rider_params
      params.require(:rider).permit(:name, :title, :image, :about, :user_id)
    end
  end    