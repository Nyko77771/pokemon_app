# Class for managing home page and home views
class HomeController < ApplicationController
  # Method for creating index view
  def index
  end

  # Method for creating profile view
  def profile
    # Obtaining current user information
    @user = current_user
    # Rendering profile view
    render :profile
  end

  # Method for creating about view
  def about
  end

  # Method for creating FAQ view
  def faq
  end

  # Method for creating result view
  def result
  end

  # Method for searching for Pokemon cards in the search bar
  def search
    # Fetching API key from environment variables
    api = ENV["PRICE_TRACKER_API"]
    # Configuring the custom Pokemon API client with the API key
    PokemonAPIClient.configure(api)
    # Checking if the name parameter is blank
    if params[:name].blank?
      redirect_to home_index_path, notice: "No Pokemon Name Given. Please Enter a Name"
      return
    end
    # Fetching Pokemon card data by name form the custom Pokemon gem (found in lib directory)
    @pokemon = PokemonAPIClient.fetch_card_by_name(params[:name])
    # Storing the retrieved cards in an instance variable
    @cards = @pokemon["data"]
    if @cards.present?
      # Logging the found cards for debugging purposes
      Rails.logger.info("----FOUND_CARDS--: #{@pokemon.inspect}")
      render :result
    else
      # Logging if no cards were retrieved
      Rails.logger.info("Nothing retrieved")
      # Redirecting to index page in home direcotory with a notice
      redirect_to home_index_path, notice: "Nothing found"
    end
  end

  # Method for creating popup view
  def popup
  end

  # Method for handling 404 not found errors
  def not_found
    render page_404, status: :not_found
  end
end
