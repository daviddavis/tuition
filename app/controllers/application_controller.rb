class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :start_timer

  def start_timer
    $timer = Time.now
  end
end
