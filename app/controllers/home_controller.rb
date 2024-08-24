class HomeController < ApplicationController
  def index
    @title = 'デイトラ'
    render 'home/index'
  end
end