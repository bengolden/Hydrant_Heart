module ApplicationHelper

  #not tested
  def current_user
    if session[:user_id]
      return User.find(session[:user_id])
    else
      nil
    end
  end

end
