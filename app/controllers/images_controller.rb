class ImagesController < ApplicationController

  def search_unsplash
    # .search(query, page = 1, per_page = 10, orientation = nil)
    @results = Unsplash::Photo.search(params[:search_term], 1, 24, params[:orientation])
  end

end
