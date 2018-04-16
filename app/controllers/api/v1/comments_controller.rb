module Api
  module V1
    class CommentsController < ApplicationController

      def index
        comments = Comment.order('created_at DESC')
        #render json: {status:'SUCCESS',message:'Loaded comments',data:comments},status: :ok
      end

      def show
        if params[:clientKey] == "OIUDFBOSU097098Y34IUBSFDV09898dvhsodfkjbaf93tb93rbrv"
            comment= Comment.where(issue: params[:issue])
            #comment= Comment.find_by(user: params[:user])
            render json: {status:'SUCCESS',message:'Loaded comment',data:comment},status: :ok
        else
            render json: {status:'FAILURE ON SHOW',message:'Incorrect Password'},status: :bad_password
        end

      end

      def create
        if params[:clientKey] == "OIUDFBOSU097098Y34IUBSFDV09898dvhsodfkjbaf93tb93rbrv"
          comment = Comment.new(comment_params)

          if comment.save
            render json: {status: 'SUCCESS', message: 'Saved Comment', data:comment},status: :ok
          else
            render json: {status: 'ERROR', message: 'Comment not saved', data:comment.error},status: :unprocessable_entity
          end
        else
            render json: {status:'FAILURE ON SHOW',message:'Incorrect Password'},status: :bad_password
        end
      end

      def destroy
        if params[:clientKey] == "OIUDFBOSU097098Y34IUBSFDV09898dvhsodfkjbaf93tb93rbrv"
          #comment = Comment.where(user: params[:user], topic: params[:issue])
          comment = Comment.find_by(user: params[:user], issue: params[:issue])
          comment.destroy
          render json: {status: 'SUCCESS', message: 'Comment deleted successfully', data:comment},status: :ok
        else
            render json: {status:'FAILURE ON SHOW',message:'Incorrect Password'},status: :bad_password
        end  
      end

      private

      def comment_params
        params.permit(:issue, :parent, :body, :user)
      end

    end
  end
end
