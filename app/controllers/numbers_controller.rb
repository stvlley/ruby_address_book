class NumbersController < ApplicationController


    def create 
        @person = Person.find(params[:person_id])
        @number = @person.numbers.create(number_params)
        respond_to do |format|
          if @number.save
            format.html { redirect_to person_path(@person), notice: "Number was successfully created." }
            format.json { render :show, status: :created, location: @number }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @number.errors, status: :unprocessable_entity }
          end
        end
        # redirect_to person_path(@person)
    end

    def destroy 
        @person = Person.find(params[:person_id])
        @number = @person.numbers.find(params[:id])
        @number.destroy
        respond_to do |format|
          format.html { redirect_to people_url, notice: "Person was successfully destroyed." }
          format.json { head :no_content }
        end
        # redirect_to person_path(@person), status: :see_other
    end 

    def index
        @number = Number.all

    end

    def edit
       @person = Person.find(params[:person_id])

    end 

    def show
        @number = Number.find(params[:id])
        @number = @person.numbers.find(params[:id])
      end

    def edit 
      @person = Person.find(params[:person_id])
    end

    def new
      @person = Person.find(params[:person_id])
      @number = @person.numbers.new
    end

    def update
        respond_to do |format|
          if @number.update(number_params)
            format.html { redirect_to person_url(@person), notice: "Person was successfully updated." }
            format.json { render :show, status: :ok, location: @person }
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @number.errors, status: :unprocessable_entity }
          end
        end
      end

    private
        def number_params 
            params.require(:number).permit(:phone_number, :commment)
        end

        def set_person
            @person = Person.find(params[:id])
          end

end
