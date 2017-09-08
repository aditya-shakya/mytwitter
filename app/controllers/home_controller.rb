class HomeController < ApplicationController
  # require 'Tweet'
  def index
    @tweets = Tweet.all.order("created_at DESC")
  end
  def new

  end
end
