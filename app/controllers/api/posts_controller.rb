class Api::PostsController < ApplicationController
    def index
        pages = params[:page]
        
        render json: Post.last(pages*10)
    end

    def create
        post = Post.new(post_params)
        if post.save
            render json: post, status: :ok
        else
            render json: post.errors, status: :unprocessable_entity
        end
    end

    def show
        post = Post.find(params[:id])
        render json: post , include: :comments
    end

    def update
        post = Post.find(params[:id])
        if post.update(post_params)
            render json: post , status: :accepted
        else
            render json: post.errors , status: :unprocessable_entity
        end
    end

    def destroy
        post = Post.find(params[:id]) 
        if post.delete
            render json: "no content", status: :no_content
        else
            render json: post.errors, status: :not_acceptable
        end
    end

    private
    def post_params
        params.require(:post).permit(:name, :content, :email, :page )
    end
end
