class TagsearchesController < ApplicationController
  before_action :authenticate_user!
  
  def search
    @model = Book
    @word = params[:content]
    @books = Book.where("category LIKE?", "%#{@word}%")
    render "tagsearches/tagsearch"
  end
end
