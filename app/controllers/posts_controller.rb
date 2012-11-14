class PostsController < ApplicationController     
  
  def create  
    if current_user.provider == "twitter"
      Twitter.configure do |tw|
        tw.consumer_key = "6jaqMt7kE9iVxh8hX0mmtQ"
        tw.consumer_secret = "5ZIydxRBFfEJxc2EzedahIxoeO8g1hZCQVqZFtWWNM"
        tw.oauth_token = "20906035-XmbA2vyFIFM7ZOUX5jZHxfi9lsn18UZAr0co7W30N"
        tw.oauth_token_secret = "BRNs7EB5LZ9PZxX9Lgx25sIx1scqfeNmNteuVIxgK08"
      end
      Twitter.update(params[:tweet])
    elsif current_user.provider == "facebook"
      me = FbGraph::User.me("")
              me.feed!(
                :message => "#{params[:tweet]}",
                :link => 'http://varyemez.herokuapp.com',
                :name => 'Siz de alacaklarınızı facebook üzerinden duyurun. Varyemez ile çok kolay :)',
              )
    end
  end 
    

end