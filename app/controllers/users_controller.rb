class UsersController < ApplicationController
  def new
    @user=User.new
  end

  def show
    @registered_applications=current_user.registered_applications
  end

  #def create
  #end

  #def update
  #end

  #def destroy
  #end
end
