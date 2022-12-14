class AddressesController < ApplicationController
  before_action :set_person

    def create       
        @address = @person.addresses.create(address_params)
        respond_to do |format|
          if @address.save
            format.html { redirect_to person_path(@person), notice: "Address was successfully created." }
            format.json { render :show, status: :created, location: @number }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @address.errors, status: :unprocessable_entity }
          end
        end
        # redirect_to person_path(@person)
    end

    def index
        @address = Address.all
    end

    def destroy
        @address = @person.addresses.find(params[:id])
        @address.destroy
        respond_to do |format|
          format.html { redirect_to people_url, notice: "Person was successfully destroyed." }
          format.json { head :no_content }
        end
        # redirect_to person_path(@person), status: :see_other
    end 

    def edit
      @address = Address.find params[:id]
    end 

    def new
      @address = @person.addresses.new
    end

    def update
        @address = Address.find params[:id]
        respond_to do |format|
          if @address.update(address_params)
            format.html { redirect_to person_url(@person), notice: "Address was successfully updated." }
            format.json { render :show, status: :ok, location: @person }
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @address.errors, status: :unprocessable_entity }
          end
        end
      end

    private

      
        def address_params
            params.require(:address).permit(:street, :town, :zipcode, :state, :country)
        end

        def set_person          
          @person = Person.find(params[:person_id])
        end
end
