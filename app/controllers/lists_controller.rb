class ListsController < ApplicationController
      before_action :require_user

    def index
        @lists = current_user.lists
        @list = List.new
    end

    def show
        @list = current_user.lists.find(params[:id])
        if @list
            render :show
        else
            redirect_to lists_path, notice: "List not found!"
        end
    end

    def create
        @list = current_user.lists.new(list_params)
        if @list.save
            redirect_to lists_path
        end
        puts "Created list: #{@list.name}"
    end

    def destroy
        @list = current_user.lists.find(params[:id])
        if @list
            @list.destroy
            redirect_to lists_path, notice: "List deleted successfully."
        else
            redirect_to lists_path, notice: "List not found."
        end
    end

    private
    def list_params
        params.require(:list).permit(:name)
    end
end
