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

  def results
    api = ENV["PRICE_TRACKER_API"]
    PokemonAPIClient.configure(api);
    pokemon = PokemonAPIClient.fetch_card_by_name(name: params[:name])
  end

end
