class UsersController < ApplicationController

  def create
    user = User.create(params[:user])
    if user.errors.empty?
      render :json => user.to_builder.target!, :status => :created
    else
      render :json => user.errors, :status => :unprocessable_entity
    end
  end
end
