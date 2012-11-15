class AuthenticationsController < ApplicationController
  def index
    @authentications = current_user.authentications.all
  end
  
  def twitter
    omni = request.env["omniauth.auth"]
    authentication = Authentication.find_by_provider_and_uid(omni['provider'], omni['uid'])
    #raise omni.to_yaml
    
    if authentication
      flash[:notice] = "Logged in Successfully"
      sign_in_and_redirect User.find(authentication.user_id)
    elsif current_user
      token = omni['credentials'].token
      token_secret = omni['credentials'].secret
      
      current_user.authentications.create!(:provider => omni['provider'], :uid => omni['uid'], :token => token, :token_secret => token_secret)
      flash[:notice] = "Authentication successful."
      sign_in_and_redirect current_user
    else
      user = User.new
      user.provider = omni.provider
      user.uid = omni.uid
        
      user.apply_omniauth(omni)
      
      if user.save
        flash[:notice] = "Logged in."
        sign_in_and_redirect User.find(user.id)             
      else
        session[:omniauth] = omni.except('extra')
        redirect_to new_user_registration_path
      end
    end 
  end
  
  def facebook
    omni = request.env["omniauth.auth"]
    authentication = Authentication.find_by_provider_and_uid(omni['provider'], omni['uid'])

    if authentication
      flash[:notice] = "Logged in Successfully"
      sign_in_and_redirect User.find(authentication.user_id)
    elsif current_user
      token = omni['credentials'].token
      token_secret = ""
      
      current_user.authentications.create!(:provider => omni['provider'], :uid => omni['uid'], :token => token, :token_secret => token_secret)
      
      flash[:notice] = "Authentication successful."
      sign_in_and_redirect current_user
    else
      user = User.new
      user.provider = omni.provider
      user.uid = omni.uid
      user.email = omni['extra']['raw_info'].email 

      user.apply_omniauth(omni)

      if user.save
        flash[:notice] = "Logged in."
        sign_in_and_redirect User.find(user.id)             
      else
        session[:omniauth] = omni.except('extra')
        redirect_to new_user_registration_path
      end
    end
  end

  def create
    raise request.env["omniauth.auth"].to_yaml
    @authentication = Authentication.new(params[:authentication])
    if @authentication.save
      redirect_to authentications_url, :notice => "Successfully created authentication."
    else
      render :action => 'new'
    end
  end

  def destroy
    @authentication = Authentication.find(params[:id])
    @authentication.destroy
    redirect_to authentications_url, :notice => "Successfully destroyed authentication."
  end
end
