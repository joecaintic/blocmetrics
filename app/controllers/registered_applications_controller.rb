class RegisteredApplicationsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @registered_application = @user.registered_applications.build(registered_application_params)
    authorize @registered_application
    if @registered_application.save
      flash[:notice] = "Registered Application was saved"
      redirect_to [@user]
    else
      flash[:notice] = "There was an error saving your application"
      render :new
    end
  end

  def show
  end

  def update
  end

  def destroy
  end

  private

    def registered_application_params
      params.require(:registered_application).permit(:name, :url)
    end

end
