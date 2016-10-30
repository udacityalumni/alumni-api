class Api::V1::ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :update, :destroy]
  after_action :verify_authorized

  respond_to :json

  # GET /articles
  def index
    @articles = Article.all
    authorize @articles

    render json: @articles
  end

  # GET /articles/1
  def show
    render json: @article
  end

  # POST /articles
  def create
    @article = Article.new(article_params)
    authorize @article

    if @article.save
      render json: @article, status: :created, location: :api_v1_articles
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /articles/1
  def update
    if @article.update(article_params)
      render json: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # DELETE /articles/1
  def destroy
    @article.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = Article.find(params[:id])
    authorize @article
  end

  # Only allow a trusted parameter "white list" through.
  def article_params
    params.require(:article).permit(:title, :user_id,
                                    :featured, :spotlighted,
                                    :content, :json,
                                    :feature_image, :status,
                                    :tags)
                                    tags_attributes: [:tag])
  end
end
