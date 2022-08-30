class EmailsController < ApplicationController
    def create
        @person = Person.find(params[:person_id])
        @email = @person.emails.create(email_params)
        redirect_to person_path(@person)
    end

    def index 
        @email = Email.all
    end

    def destroy 
        @person = Person.find(params[:person_id])
        @email = @person.emails.find(params[:id])
        @email.destroy
        redirect_to person_path(@person), status: :see_other
    end

    def edit 
    
    end
    
    def update
        respond_to do |format|
          if @email.update(email_params)
            format.html { redirect_to person_url(@person), notice: "Person was successfully updated." }
            format.json { render :show, status: :ok, location: @person }
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @person.errors, status: :unprocessable_entity }
          end
        end
      end

    private
        def email_params
            params.require(:email).permit(:email, :comment)
        end
end
