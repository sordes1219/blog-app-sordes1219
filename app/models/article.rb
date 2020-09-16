# frozen_string_literal: true

# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  content    :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Article < ApplicationRecord
  validates :title, presence: true
  validates :title, length: { minimum: 2, maximum: 100 }
  validates :title, format: { with: /\A(?!\@)/}
  validates :content, presence: true
  validates :content, length: { minimum: 10 }
  validates :content, uniqueness: true
  validate :validate_title_and_content_length

  private
  def validate_title_and_content_length
    char_count = self.title.length + self.content.length
    errors.add(:content, '100文字以上にしてください') unless char_count > 100
  end
end
