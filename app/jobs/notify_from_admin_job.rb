class NotifyFromAdminJob < ApplicationJob
  queue_as :default
  
  def perform(msg)
    User.all.each do |user|
      NotifyFromAdminMailer.notify(user, msg).deliver_later
    end
  end

end