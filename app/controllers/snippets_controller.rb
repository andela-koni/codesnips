class SnippetsController < ApplicationController
  def index
    @snippets = Snippet.all
  end

  def show
    @snippet = Snippet.find params[:id]
  end

  def new
    @snippet = Snippet.new
  end

  def create
    snippet = Snippet.create snippet_params

    redirect_to snippet
  end

  def edit
    @snippet = Snippet.find params[:id]
  end

  def update
    snippet = Snippet.find params[:id]
    snippet.update snippet_params
    redirect_to snippet
  end

  def destroy
    snippet = Snippet.find params[:id]
    snippet.destroy
    redirect_to action: :index
  end

  private

  def snippet_params
    params.require(:snippet).permit(:title, :content)
  end
end
