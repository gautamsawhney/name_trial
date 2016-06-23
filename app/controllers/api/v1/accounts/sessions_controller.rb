class Api::V1::Accounts::SessionsController < Api::V1::BaseController

  skip_before_filter :authenticate_user_from_token!, :only => [:create]

  def create
    @account = Account.find_for_database_authentication(email: signin_parameters[:email])
    return user_not_found unless @account
   
    if @account.valid_password?(signin_parameters[:password])
      sign_in(@account)
       @auth_token = Authtoken.create_auth_token(@account.id,request.remote_ip, request.user_agent, signin_parameters[:device_id])
      render json: {auth_token:@auth_token.token}
    else
      invalid_login_attempt
    end
  end

  def destroy
    account_token = params[:auth_token].presence
    auth_token =  Authtoken.find_by_token(account_token.to_s)

    account  = auth_token.account if auth_token.present?

    if account
      sign_out(account)
      Authtoken.destroy_auth_token(account_token.to_s)
      render status: 200, json: {message: "account succesfully logged out."}
    else
      user_not_found
    end
  end

  def signin_parameters
    params.require(:account).permit( :email, :password, :device_id)
  end

  def invalid_login_attempt
    warden.custom_failure!
    render status: 400, json: {error: "Error with your email or password"}
  end

  def user_not_found
    render status: 404, json: {error: "User not found"}
  end

end

