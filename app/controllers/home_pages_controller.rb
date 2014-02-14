class HomePagesController < ApplicationController
  def home
    @carousel = Gallery.find_by(title: "home_carousel")
  end

  def gallery
  end

  def blog
  end

  def locations
  end

  def about
  end

  def contact
  end
end
