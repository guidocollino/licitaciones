class LoginController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    answer = user_signed_in? ? current_user.email.to_s : 'Usuario Anonimo'
    render :text => answer
  end
  
end
