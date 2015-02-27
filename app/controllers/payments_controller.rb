class PaymentsController < ApplicationController

  before_action :authenticate_user!
  before_action :find_pledge

  def new
  end

  def create
    # render json: params
    service = Payment::CreateWithStripe.new(
      user: current_user,
      pledge: @pledge,
      stripe_token: params[:stripe_token])
      if service.call
        redirect_to @pledge.idea, notice: "thanks for pledging"
        else
        @error_message = "Sorry something went wrong"
        render :new
      end
  end

  private

  def find_pledge
    @pledge = current_user.pledges.find params[:pledge_id]
  end
  
end
