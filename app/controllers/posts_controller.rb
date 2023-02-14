class PostsController < ApplicationController

before_action :authenticate_user!, only: [:new, :create]

    def index
      if params[:search] == nil
        @post = params[:tag_id].present? ? Tag.find(params[:tag_id]).posts : Post.all.order(created_at: :desc)
      elsif params[:search] == ''
        @post = params[:tag_id].present? ? Tag.find(params[:tag_id]).posts : Post.all.order(created_at: :desc)
      else
        search = params[:search]
        @post = Post.where("title LIKE ? OR country LIKE ? OR region LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%").order(created_at: :desc)
      end
    end
   

    def new
        @post = Post.new

        if params[:tag]
          Tag.create(name: params[:tag])
        end

    end
    

    def create
        post = Post.new(post_params)

        post.user_id = current_user.id

        if post.save!
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
        params.require(:post).permit(:title, :period, :country, :region, :about, :image, :tag_ids)
    end
end
