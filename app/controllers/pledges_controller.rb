class PledgesController < ApplicationController

  before_action :authenticate_user!

  def new
    @pledge = Pledge.new
  end


  def create
    @pledge = Pledge.new pledge_params
    @pledge.idea = @idea
    @pledge.user = current_user
    if @pledge.save
      redirect_to new_pledge_payment_path(@pledge) 
    else
      render :new
    end
  end

  def delete
  end

  def index
  end

  private

  def find_idea
    @idea = Idea.find params[:idea_id]
  end

  def pledge_params
    params.require(:pledge).permit(:amount)
  end



end
