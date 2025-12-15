# Class for managing user lists
class ListsController < ApplicationController
    # Checking if user is logged before doing any other actions
    before_action :require_user

    # Display all lists for the current user
    def index
        @lists = current_user.lists
        # Assigning a new list object to be used in the view for creating new lists
        @list = List.new
    end

    # Method for showing a specific list
    def show
        @list = current_user.lists.find(params[:id])
        if @list
            render :show
        else
            redirect_to lists_path, notice: "List not found!"
        end
    end

    # Method for creating a new list for the current user
    def create
        @list = current_user.lists.new(list_params)
        if @list.save
            redirect_to lists_path
        end
        puts "Created list: #{@list.name}"
    end

    # Method for deleting a specific list
    def destroy
        @list = current_user.lists.find(params[:id])
        if @list
            @list.destroy
            redirect_to lists_path, notice: "List deleted successfully."
        else
            redirect_to lists_path, notice: "List not found."
        end
    end

    # Private method for checking permitted parameters
    private
    def list_params
        params.require(:list).permit(:name)
    end
end
