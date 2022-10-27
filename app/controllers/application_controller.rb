class ApplicationController < ActionController::Base
  def current_user
    User.order(created_at: :desc).limit(1)
  end

end
