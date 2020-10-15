require 'rails_helper'

RSpec.describe "Articles", type: :request do
  let!(:user) { create(:user) }
  let!(:article) { create_list(:article, 3, user: user) }
  
  describe "GET /articles" do
    it "200が返る事" do
      get articles_path
      expect(response).to have_http_status(200)
    end
  end

  context 'ログインしている場合' do
    before do
      sign_in user
    end

    describe "POST /articles" do
      it "302が返る事" do
        article_params = attributes_for(:article)
        post articles_path({ article: article_params })
        expect(response).to have_http_status(302)
        expect(Article.last.title).to eq(article_params[:title])
        expect(Article.last.content.body.to_plain_text).to eq(article_params[:content])
      end
    end
  end

  context 'ログインしていない場合' do
    it 'ログイン画面に遷移する' do
      article_params = attributes_for(:article)
      post articles_path({ article: article_params })
      expect(response).to redirect_to(new_user_session_path)  
    end
  end

end
