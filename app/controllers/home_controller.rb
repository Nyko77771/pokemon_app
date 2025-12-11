class HomeController < ApplicationController

  def index
  end

  def not_found
    render page_404, status: :not_found
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

    @pokemon = PokemonAPIClient.fetch_card_by_name(params[:name])
    @cards = @pokemon['data']
    if @cards.present?
      Rails.logger.info("Found cards: #{@pokemon.inspect}")
      render :result
    else
      Rails.logger.info("Nothing retrieved")
      render index, notice: "Nothing found"
    end
  end

end
