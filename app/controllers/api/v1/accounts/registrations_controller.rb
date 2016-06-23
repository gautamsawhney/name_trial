class Api::V1::Accounts::RegistrationsController < Api::V1::BaseController

  skip_before_filter :authenticate_user_from_token!, :only => [:create]
  
  def create
    @account = Account.new signup_parameters
    if @account.save
      @auth_token = Authtoken.create_auth_token(@account.id,request.remote_ip, request.user_agent, signup_parameters[:device_id])
      render json: {message: "#{@account.email} was succesfully created", auth_token: @auth_token.token}
    else
      render json: {error: @account.errors.full_messages }
    end
  end

  protected

  def signup_parameters
    params.require(:account).permit( :email,:password,:password_confirmation,:device_id)
  end
end


