class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :take_shit

  def take_shit
    puts "lkjasfdlkjasfd"  
    puts "lkjasfdlkjasfd"  
    puts "lkjasfdlkjasfd"  
    puts "lkjasfdlkjasfd"  
  end
end
