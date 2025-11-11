class ListsController < ApplicationController
      before_action :require_user

    def index
        @lists = current_user.lists
        @list = List.new
    end

    def show
        @list = current_user.lists.find_by(name: params[:name])
    end

    def create
        @list = current_user.lists.new(list_params)
        if @list.save
            redirect_to lists_path
        end
        puts "Created list: #{@list.name}"
    end

    def delete
        @list = current_user.lists.find_by(name: params[:name])
        if @list
            @list.destroy
        end
    end

    private
    def list_params
        params.require(:list).permit(:name)
    end
end
