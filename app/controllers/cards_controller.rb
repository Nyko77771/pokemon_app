class CardsController < ApplicationController

    def create
        Rails.logger.debug "----PARAMS---- #{params.inspect}"

        @list = List.find(params[:list_id])
        @card = Card.new(card_params)
        if @card.save
            CardsInList.create(list: @list, card: @card)
            redirect_to list_path(@list), notice: "Card successfully added."
        else
            redirect_to list_path(@list), notice: "Failed to add card."
        end
    end

    private
    def card_params
        params.require(:card).permit(:name, :set_name, :card_number, :card_text, :rarity, :image_url, :market_price)
    end
end