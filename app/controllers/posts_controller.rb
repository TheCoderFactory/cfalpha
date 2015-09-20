class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: :show
  require 'csv'

  def export
    @posts = Post.all
    posts_csv = CSV.generate do |csv|
      csv << ["title", "lead", "content", "image", "slug", "published_date", "impressions_count", "user_id", "publish"]
      @posts.each do |post|
        csv << [post.title, post.lead, post.content, post.image, post.slug, post.published_date, post.impressions_count, post.user_id, post.publish]
      end
    end
    send_data(posts_csv, :type => 'text/csv', :filename => 'all_posts.csv')
  end

  def import
    Post.import(params[:file])
    redirect_to posts_url, notice: "Posts imported."
  end

  def index
    @posts = Post.reverse_chron_order
  end

  def show
    @author = @post.user
    @popular_posts = Post.popular_posts.limit(3)
    @post_categories = PostCategory.all
    @tags = ActsAsTaggableOn::Tag.most_used(10)
    # impressionist(@post)
    
  end

  def new
    @post = Post.new
    
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private
    def set_post
      @post = Post.friendly.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:post_category_id, :tag_list, :title, :lead, :content, :image, :slug, :publish, :published_date, :author_id, :tag_list => [])
    end
end
