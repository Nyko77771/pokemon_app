class HomeController < ApplicationController

  def index
  end

  def not_found
    render page_404, status: :not_found
  end

  def about
  end

end
