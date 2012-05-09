class SessionsController < ApplicationController

  def callback
    auth = request.env["omniauth.auth"]
    user = User.where(provider: auth["provider"], uid: auth["uid"]).first || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to root_url, notice: "login success!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "logout"
  end

  def failure
    render_text %Q{<span style="color:red;">Auth Failure</span>}
  end
end
