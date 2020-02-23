class HomeController < ApplicationController
  def home
    redirect_to animals_path if logged_in?
  end
end
