class EmailsController < ApplicationController
  before_action :set_person

  def create
      @email = @person.emails.create(email_params)
      respond_to do |format|
        if @email.save
          format.html { redirect_to person_path(@person), notice: "Email was successfully created." }
          format.json { render :show, status: :created, location: @number }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @email.errors, status: :unprocessable_entity }
        end
      end
      # redirect_to person_path(@person)
  end

  def index 
    @email = Email.all
  end

  def destroy 
      @email = @person.emails.find(params[:id])
      @email.destroy
      respond_to do |format|
        format.html { redirect_to people_url, notice: "Email was successfully destroyed." }
        format.json { head :no_content }
      end
      # redirect_to person_path(@person), status: :see_other
  end

  def edit
    @email = Email.find(params[:id])
  end


  def new
    @email = @person.emails.new
  end
  
  def update
    @email = Email.find params[:id]
      respond_to do |format|
        if @email.update(email_params)
          format.html { redirect_to person_url(@person), notice: "Email was successfully updated." }
          format.json { render :show, status: :ok, location: @person }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @email.errors, status: :unprocessable_entity }
        end
      end
    end

  private


      def email_params
          params.require(:email).permit(:email, :comment)
      end

      def set_person
        @person = Person.find(params[:person_id])
      end
end