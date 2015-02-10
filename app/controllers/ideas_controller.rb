class IdeasController < ApplicationController

  def index
    # render text: "hello world"
    @ideas = Idea.all
    
    # <%if user_signed_in? %>
    #   current_user.id 
    # <%end%>


  end

  

  def new
    # render text: "create a new project"
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(params.require(:idea).permit(:title, :explanation))
    # @idea.user_id=current_user.id
    @idea.user = current_user #this line is what associates the idea with the user
    if @idea.save
    redirect_to root_path, notice: "idea created!"
    else
    redirect_to root_path, notice: "cant create idea, something went wrong :/"
    end
  end


end



  # def index

  #   if user_signed_in? 
  #   @tweet = current_user.tweets.new
  #   else
  #   @tweet=Tweet.new
  #   end
  #   @tweets = Tweet.all
  # end
  # ##########################################
  # def new
  #   @tweet = Tweet.new
  # end
  # ##########################################
  # def create

  #   @tweet = Tweet.new tweet_params 
  #   @tweet.user_id = current_user.id


  #   @tweet.save
  #   redirect_to root_path  
  # end