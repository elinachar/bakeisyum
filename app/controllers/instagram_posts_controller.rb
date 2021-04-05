class InstagramPostsController < ApplicationController
  before_action :set_instagram_post, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /instagram_posts
  # GET /instagram_posts.json
  def index
    @instagram_posts = InstagramPost.paginate(page: params[:page], per_page: 9)
    if Rails.env.production?
      @instagram_posts = @instagram_posts.order("id DESC")
    else
      @instagram_posts = @instagram_posts.order('"instagram_posts"."id" DESC')
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /instagram_posts/1
  # GET /instagram_posts/1.json
  def show
  end

  # GET /instagram_posts/new
  def new
    @instagram_post = InstagramPost.new
  end

  # GET /instagram_posts/1/edit
  def edit
  end

  # POST /instagram_posts
  # POST /instagram_posts.json
  def create
    @instagram_post = InstagramPost.new(instagram_post_params)

    respond_to do |format|
      if @instagram_post.save
        format.html { redirect_to @instagram_post, notice: 'Instagram post was successfully created.' }
        format.json { render :show, status: :created, location: @instagram_post }
      else
        format.html { render :new }
        format.json { render json: @instagram_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /instagram_posts/1
  # PATCH/PUT /instagram_posts/1.json
  def update
    respond_to do |format|
      if @instagram_post.update(instagram_post_params)
        format.html { redirect_to @instagram_post, notice: 'Instagram post was successfully updated.' }
        format.json { render :show, status: :ok, location: @instagram_post }
      else
        format.html { render :edit }
        format.json { render json: @instagram_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instagram_posts/1
  # DELETE /instagram_posts/1.json
  def destroy
    @instagram_post.destroy
    respond_to do |format|
      format.html { redirect_to instagram_posts_url, notice: 'Instagram post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instagram_post
      @instagram_post = InstagramPost.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def instagram_post_params
      # params.fetch(:instagram_post, {})
      params.require(:instagram_post).permit(:image_url, :recipe_title, :recipe_href)
    end
end
