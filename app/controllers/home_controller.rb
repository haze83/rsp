class HomeController < ApplicationController
  def index
    @users = User.all
    @articles = Article.where(:navigation_id => nil)
  end
end
