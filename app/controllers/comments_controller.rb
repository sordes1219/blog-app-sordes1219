# frozen_string_literal: true

class CommentsController < ApplicationController
  def new
    article = Article.find(params[:article_id])
    @comment = article.comments.build
  end

  def create
    article = Article.find(params[:article_id])
    @comment = article.comments.build(comment_params)
    # binding-pry
    if @comment.save
      redirect_to article_path(article), notice: 'コメントを追加しました'
    else
      flash.now[:error] = 'コメントを追加できませんでした'
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
