class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.order(:name).map { |user| user.to_pleasant_string }.
             join("\n")
  end

  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]
    new_user = User.create!(
      name: name,
      email: email,
      password: password,
    )
    response_text = "new user is created with id #{new_user.id}"
    render plain: response_text
  end

  def check
    email = params[:email]
    password = params[:password]
    render plain: User.where("email=? and password=?", email, password).exists?
  end
end
