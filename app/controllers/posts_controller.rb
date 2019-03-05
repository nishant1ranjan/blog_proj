class PostsController < ApplicationController
    def index
    @post=Post.order('updated_at DESC')  
    end
    def new
    @post=Post.new
    end
    def edit
     @post = Post.find(params[:id])
    end
    def create
    @post=Post.new(post_params)
    if @post.save
      redirect_to  posts_index_path
      flash[:success] = 'Your Article has been sent to Admin for publishing!'

    else
      render 'new'
      flash[:warning] = 'Something went wrong.'

    end
    end
    def show
    @post=Post.all

    end
    def destroy
    @post = Post.find(params[:id])
    @post.destroy
 
    redirect_to posts_path
   end
   def edit
    @post = Post.find(params[:id])
    
   end
   def update
     @post = Post.find(params[:id])
     
 
  if @post.update(post_update_params)

    redirect_to posts_path
    flash[:success] = 'Update Sucessfull!'

  else
    render 'edit'
    flash[:warning] = 'Something went wrong.'

  end
end
def show
    @post = Post.find(params[:id])
  end
  
  def mypost
    @post=User.find(params[:user_id]).posts
  end
     

     private
        def post_params
        params[:post][:user_id] = current_user.id
         params.require(:post).permit(:title,:body,:user_id,:all_tags,:published)
      end
      def post_update_params
        params[:post][:user_id] = @post.user_id
         params.require(:post).permit(:title,:body,:user_id,:all_tags,:published)
      end
    
end
