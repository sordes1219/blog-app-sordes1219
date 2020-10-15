require 'rails_helper'

RSpec.describe "Api::Comments", type: :request do
  describe "GET /comments" do

    let!(:user) { create(:user) }
    let!(:article) { create(:article, user: user)}
    let!(:comment) { create_list(:comment, 3,article: article)}

    it "200 status" do
      get api_comments_path(article_id: article.id)
      expect(response).to have_http_status(200)

      body = JSON.parse(response.body)
      expect(body.length).to eq(3)
      expect(body[0]['content']).to eq(comment.first.content)
      expect(body[1]['content']).to eq(comment.second.content)
      expect(body[2]['content']).to eq(comment.third.content)

    end
  end
end
