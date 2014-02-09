class HomePagesController < ApplicationController
  def home
    @carousel = Gallery.first
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
