class NumbersController < ApplicationController
    def create 
        @person = Person.find(params[:person_id])
        @number = @person.numbers.create(number_params)
        redirect_to person_path(@person)
    end

    def destroy 
        @person = Person.find(params[:person_id])
        @number = @person.numbers.find(params[:id])
        @number.destroy
        redirect_to person_path(@person), status: :see_other
    end 

    # def index
    #     @number = Number.all

    # end

    # def new 
    #     @number = Number.new
    # end

    def show
        @number = Number.find(params[:id])
      end

    # def create 
    #     @number = Number.new(number_params)
    #     if @number.save
    #         redirect_to person_path(@person)
    #     else
    #         render :new, status: :unprocessable_entity
    #     end 
    # end

    private
        def number_params 
            params.require(:number).permit(:phone_number, :commment)
        end

end
