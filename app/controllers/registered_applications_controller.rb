class RegisteredApplicationsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @registered_application = @user.registered_applications.build(registered_application_params)
    authorize @registered_application
    if @registered_application.save
      flash[:notice] = "Application was registered"
      redirect_to [@user]
    else
      flash[:notice] = "There was an error registering your application"
      render :new
    end
  end

  def show
  end

  def update
  end

  def destroy
    @user = User.find(params[:user_id])
    @registered_application = @user.registered_applications.find(params[:id])
    authorize @registered_application
      if @registered_application.destroy
        flash[:notice] = "Application was deleted successfully." 
      else
        flash[:error] = "There was an error deleting the application."
      end

      respond_to do |format|
       format.html
       format.js
      end
  end

  private

    def registered_application_params
      params.require(:registered_application).permit(:name, :url)
    end

end
