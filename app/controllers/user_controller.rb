class UserController < ApplicationController
  def show
     if @user = User.find_by(id: params[:id])
      @events = @user.events
      @attendances = @user.attended_events
     else 
      redirect_to root_path
     end
  end
end