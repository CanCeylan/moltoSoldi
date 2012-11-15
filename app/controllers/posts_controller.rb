class PostsController < ApplicationController     
  
  def create  
    if params[:post_type] == "twitter"
      if twitter = current_user.authentications.find_by_provider("twitter")
        Twitter.configure do |tw|
          tw.consumer_key = "IKKOT98ZE5iJpLbQrno1Og"
          tw.consumer_secret = "mVkcL3B95tKXYS2VjwEJruvpIBB39pUUw7j7vsj8"
          tw.oauth_token = twitter.token
          tw.oauth_token_secret = twitter.token_secret
        end
        Twitter.update(params[:tweet])
        @message = "Your tweet successfully sent to Twitter."
      else 
        @message = "Sorry, you first need to authenticate your Twitter acount."
      end
    elsif params[:post_type] == "facebook" 
      if facebook = current_user.authentications.find_by_provider("facebook")  
          me = FbGraph::User.me(facebook.token)
          me.feed!(
            :message => "#{params[:tweet]}",
            :link => 'http://moltosoldi.herokuapp.com',
            :name => 'The best way of keeping track of lends & borrows from Orhan Can Ceylan.',
          )
        @message = "Your post successfully sent to FaceBook."
      else
        @message = "Sorry, you first need to authenticate your FaceBook acount."
      end
    end
    
    
    
    end
end