class IdeasController < ApplicationController

  def index
    # render text: "hello world"
    @ideas = Idea.all
  end

  def new
    # render text: "create a new project"
  end

end
