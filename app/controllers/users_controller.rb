class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def index
    render plain: User.order(:email).map { |user| user.to_pleasant_string }.
             join("\n")
  end

  def new
  end

  def create
    user = User.create!(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
    )
    session[:current_user_id] = user.id
    redirect_to todos_path
  end

  def check
    email = params[:email]
    password = params[:password]
    render plain: User.where("email=? and password=?", email, password).exists?
  end
end
