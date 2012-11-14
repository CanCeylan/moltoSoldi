class PostsController < ApplicationController     
  
  def create  
    if params[:post_type] == "twitter"
      if twitter = current_user.authentications.find_by_provider("twitter")
        Twitter.configure do |tw|
          tw.consumer_key = "6jaqMt7kE9iVxh8hX0mmtQ"
          tw.consumer_secret = "5ZIydxRBFfEJxc2EzedahIxoeO8g1hZCQVqZFtWWNM"
          tw.oauth_token = twitter.token
          tw.oauth_token_secret = twitter.token_secret
        end
        Twitter.update(params[:tweet])
      end
    else params[:post_type] == "facebook" 
      if facebook = current_user.authentications.find_by_provider("facebook")  
          me = FbGraph::User.me(facebook.token)
          me.feed!(
            :message => "#{params[:tweet]}",
            :link => 'http://moltosoldi.herokuapp.com',
            :name => 'The best way of keeping track of lends & borrows from Orhan Can Ceylan.',
          )
      end
    end
    
    
    
    end
end