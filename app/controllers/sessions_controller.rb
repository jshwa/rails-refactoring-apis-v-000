class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: :create

  def create
    user = GithubService.new
    session[:token] = user.authenticate!(ENV["GITHUB_CLIENT"], ENV["GITHUB_SECRET"], params[:code])
    session[:username] = user.get_username
    redirect_to '/'
  end
end
