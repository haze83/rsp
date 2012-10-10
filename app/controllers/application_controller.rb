class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :setup_navigation
  
  private
    def setup_navigation
      
      @navigations = Navigation.asc("sort", "name")
    end
end
