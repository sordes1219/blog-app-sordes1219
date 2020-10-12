class RelationshipMailer < ApplicationMailer
  def new_follower(user, follower)
    @user = user
    @follower = follower
    puts account_url(@follower)
    mail to: user.email, subject: '【お知らせ】フォローされました'
  end
end