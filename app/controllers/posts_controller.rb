class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  # before_action :authenticate_user!, only: [:show, :create]
  # before_action :move_to_index, except: [:index, :show, :search, :new, :destroy, :edit, :create, :update]

  
  def index
    # @posts = Post.all
  end

  def show
    @comment = Comment.new
  end

  def new
    @post = Post.new
    
  end

  def edit
  end

  def search
    # @items = Item.search(params[:keyword])
    # @posts = User.where('name LIKE(?)', "%#{params[:keyword]}%")
    # respond_to do |format|
    #   format.html
    #   format.json
    # end
  end
  


  def create
    @post = Post.new(post_params)  
    if @post.save
      redirect_to root_path
    else
      render :new
    end

  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render :new
    end
  end

  def destroy
    if @post.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end


  def post_params
    params.require(:post).permit(:title, :body, :image, :name).merge(user_id: current_user.id)
  end

end