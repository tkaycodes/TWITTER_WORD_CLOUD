class TweetsController < ApplicationController
  
  # before_action :get_client, only: :index

  def index
    @client=Twitterclient.client
    render params[:homefeed] ? "homefeed" : "index"  
  end


  

   


 

end
