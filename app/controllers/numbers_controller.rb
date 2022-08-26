class NumbersController < ApplicationController
    def create 
        @person = Person.find(params[:person_id])
        @number = @person.numbers.create(number_params)
        redirect_to person_path(@person)
    end

    def index
        @number = Number.all

    end

    private
        def number_params 
            params.require(:number).permit(:phone_number, :commment)
        end

end
