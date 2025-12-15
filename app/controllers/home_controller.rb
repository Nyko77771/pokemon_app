class HomeController < ApplicationController

  def index
  end

  def profile
    @user = current_user
    render :profile
  end

  def about
  end

  def faq
  end

  def result
  end

  def search
    api = ENV["PRICE_TRACKER_API"]
    PokemonAPIClient.configure(api);
    if params[:name].blank?
      redirect_to home_index_path, notice: "No Pokemon Name Given. Please Enter a Name"
      return
    end
    @pokemon = PokemonAPIClient.fetch_card_by_name(params[:name])
    @cards = @pokemon['data']
    if @cards.present?
      Rails.logger.info("Found cards: #{@pokemon.inspect}")
      render :result
    else
      Rails.logger.info("Nothing retrieved")
      redirect_to home_index_path, notice: "Nothing found"
    end
  end

  def add_card
  end

  def popup
  end

  def not_found
    render page_404, status: :not_found
  end

end
