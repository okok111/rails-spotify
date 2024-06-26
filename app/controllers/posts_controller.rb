class PostsController < ApplicationController
  before_action :authenticate_user! , except: [:show, :index]
  require 'rspotify'
  RSpotify.authenticate(ENV['SPOTIFY_CLIENT_ID'], ENV['SPOTIFY_SECRET_ID'])
  def index
      @posts = Post.all
  end

  def new
      @post = Post.new
      @track = RSpotify::Track.find(params[:track_id]) if params[:track_id]
  end

  def create
      post = Post.new(post_params)
      post.user_id = current_user.id
      if post.save
          redirect_to :action => "index"
      else
          redirect_to :action => "new"
      end
  end
 
  def show
      @post = Post.find(params[:id])
      @comments = @post.comments
      @comment = Comment.new
      
  end

  def edit
      @post = Post.find(params[:id])
  end

  def update
      post = Post.find(params[:id])
      if post.update(post_params)
          redirect_to :action => "show", :id => post.id
      else
          redirect_to :action => "new"
      end
  end

  def destroy
      post = Post.find(params[:id])
      post.destroy
      redirect_to action: :index
  end

  private
  def post_params
      params.require(:post).permit(:title, :contents ,:image,:artist_name, :album_name, :track_name, :album_image, :preview_url)
  end

end
