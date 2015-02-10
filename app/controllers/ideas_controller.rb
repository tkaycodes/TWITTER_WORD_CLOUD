class IdeasController < ApplicationController

  def index
    # render text: "hello world"
    @ideas = Idea.all
  end

  def new
    # render text: "create a new project"
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(params.require(:idea).permit(:title, :explanation))
    if @idea.save
    redirect_to root_path, notice: "idea created!"
    else
    redirect_to root_path, notice: "cant create idea, something went wrong :/"
    end
  end


end
