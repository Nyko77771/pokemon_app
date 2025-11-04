class ListsController < ApplicationController
    
    def index
        @lists = user.lists
    end

    def show(name)
        @list = user.lists.where(name: name).first
    end

    def create(name)
        @list = user.lists.create!(name: name)
        
        puts "Created list: #{@list.name}"
    end

    def delete(name)
        @list = user.lists.where(name: name).first
        if @list.nil?
            return false
        else
            @list.destroy
            return true
        end
    end
end
