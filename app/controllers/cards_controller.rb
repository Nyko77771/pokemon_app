# Class for managing card-related actions
class CardsController < ApplicationController

    # Method for creating a new card and associating it with a list
    def create
        # Checking the parameters.
        Rails.logger.debug "----PARAMS---- #{params.inspect}"

        # Finding the list by id.
        @list = List.find(params[:list_id])
        # Creating a new card with the provided parameters.
        @card = Card.new(card_params)
        if @card.save
            # If the card is saved successfully then connect it to card_in_list collection
            CardsInList.create(list: @list, card: @card)
            redirect_to list_path(@list)
        else
            redirect_to list_path(@list), notice: "Failed to add card."
        end
    end

    # Method for deleting a card
    def destroy
        # Logging the parameters for debugging purposes.
        Rails.logger.debug "----PARAMS---- #{params.inspect}"
        # Deleting the card from the specified list.
        CardsInList.where(list_id: params[:list_id], card_id: params[:card_id]).destroy_all
        redirect_to list_path(params[:list_id]), notice: "Card removed from list."
    end
        

    # Private method for permitting card parameters
    # Defines the allowed parameters for a card.
    private
    def card_params
        params.require(:card).permit(:name, :set_name, :card_number, :card_text, :rarity, :image_url, :market_price)
    end
end