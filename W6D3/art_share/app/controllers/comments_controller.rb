class CommentsController < ApplicationController

    def index 
        if params.has_key?(:user_id)
            @comments = Comment.where(commenter_id: params[:user_id])
        else 
            @comments = Comment.all
        end 
        render json: @comments
    end 

    def create
        @comments = Comment.new(comments_params)
        if @comments.save 
            render json: @comments
        else
            render json: @comments.errors.full_messages, status: 422
        end 
    end 

    def destroy 
        @comments = Comment.find(params[:id])
        @comments.delete
        render json: @comments
    end 

    private

    def comments_params
        params.require(:artwork).permit(:body, :commenter_id, :artwork_id)
    end 

end 