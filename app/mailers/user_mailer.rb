class UserMailer < ActionMailer::Base
  default :from => "spencer.kline@gmail.com"
  
  
  def welcome_email(user)
      @user = user
      @url  = "http://nutranation.heroku.com/"
      mail(:to => user.email,
           :subject => "Welcome to NutraNation")
  end
  
  def comment_email(comment)
    @comment = comment
    @post = comment.post
    @user =  @post.user
    @commenter = comment.user
    @url  = "http://nutranation.heroku.com/posts/#{@post.id}"
    mail(:to => @user.email,
         :subject => "#{@commenter.name} commented on your post")
  end
  
  def follower_email(relationship)
       @follower = User.find(relationship.follower_id)
       @user = User.find(relationship.followed_id)
       @url  = "http://nutranation.heroku.com/users/#{@follower.id}"
       mail(:to => @user.email,
            :subject => "#{@follower.name} started following you")
  end
  
  def message_email(message)
        @sender = message.sender
        @user = message.receiver
        @message = message
        @url  = "http://nutranation.heroku.com/messages/#{message.id}"
        mail(:to => @user.email,
           :subject => "#{@sender.name} sent you a message")
  end
  
end
