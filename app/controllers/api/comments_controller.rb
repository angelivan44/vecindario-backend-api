class Api::CommentsController < ApplicationController
    def index
        render json: Comment.all
    end
    def create
        comment = Comment.new(comment_params)
        if comment.save
            render json: comment, status: :ok
        else
            render json: comment.errors, status: :unprocessable_entity
        end
    end

    def show
        comment = Comment.find(params[:id])
        render json: comment
    end

    def update
        comment = Comment.find(params[:id])
        if comment.update(comment_params)
            render json: comment , status: :accepted
        else
            render json: comment.errors , status: :unprocessable_entity
        end
    end

    def destroy
        comment = Comment.find(params[:id]) 
        if comment.delete
            render json: "no content", status: :no_content
        else
            render json: comment.errors, status: :not_acceptable
        end
    end

    private
    def comment_params
        params.require(:comment).permit(:name, :content, :email, :post_id )
    end
end
