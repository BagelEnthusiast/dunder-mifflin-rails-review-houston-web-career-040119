class DogsController < ApplicationController


    before_action :current_dog, only: [:show]

    def index
        #byebug
        @dogs = Dog.all.sort_by do |dog|
            dog.employees.uniq.count
        end

    end

    def show
        
    end

    private

    def current_dog
        @dog = Dog.find(params[:id])
    end


end
