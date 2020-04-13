class UsersController < ApplicationController
  def index
    render plain: User.order(:email).map { |user| user.to_pleasant_string }.
             join("\n")
  end

  def new
  end

  def create
    User.create!(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: [:password],
    )
  end

  def check
    email = params[:email]
    password = params[:password]
    render plain: User.where("email=? and password=?", email, password).exists?
  end
end
