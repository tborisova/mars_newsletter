module ControllerMacros

  def login_user(user)
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @request.headers.merge!(user.create_new_auth_token)
    allow(controller).to receive(:current_user).and_return user
    
    sign_in @user
  end
end