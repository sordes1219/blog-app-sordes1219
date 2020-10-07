# == Schema Information
#
# Table name: relationships
#
#  id           :bigint           not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  follower_id  :bigint           not null
#  following_id :bigint           not null
#
# Indexes
#
#  index_relationships_on_follower_id   (follower_id)
#  index_relationships_on_following_id  (following_id)
#
# Foreign Keys
#
#  fk_rails_...  (follower_id => users.id)
#  fk_rails_...  (following_id => users.id)
#
class Relationship < ApplicationRecord
  
  require 'sendgrid-ruby'
  include SendGrid
  
  belongs_to :follower, class_name: 'User'
  belongs_to :following, class_name: 'User'

  after_create :send_grid

  private

  def send_email
    RelationshipMailer.new_follower(following,follower).deliver_now
  end

  def send_grid
    from = SendGrid::Email.new(email: 'test@example.com')
    to = SendGrid::Email.new(email: 'zaza.yn@gmail.com' )
    subject = 'Sending with Twilio SendGrid is Fun'
    content = SendGrid::Content.new(type: 'text/plain', value: 'and easy to do anywhere, even with Ruby')
    mail = SendGrid::Mail.new(from, subject, to, content)

    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    puts response.status_code
    puts response.body
    puts response.parsed_body
    puts response.headers
  end

end
