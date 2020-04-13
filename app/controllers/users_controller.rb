class UsersController < ApplicationController
  def index
    render plain: User.order(:email).map { |user| user.to_pleasant_string }.
             join("\n")
  end

  def new
  end

  def create
    first_name = params[:first_name]
    last_name = params[:last_name]
    email = params[:email]
    password = params[:password]
    new_user = User.create!(
      first_name: first_name,
      last_name: last_name,
      email: email,
      password_digest: password,
    )
    redirect_to users_path
  end

  def check
    email = params[:email]
    password = params[:password]
    render plain: User.where("email=? and password=?", email, password).exists?
  end
end
