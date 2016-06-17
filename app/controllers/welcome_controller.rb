class WelcomeController < ApplicationController

  def index
  @banners = Banner.all 
  end
end
