# frozen_string_literal: true

module ArticleDecorator

  def author_name
    user.display_name
  end

  def like_count
    likes.count
  end

end
