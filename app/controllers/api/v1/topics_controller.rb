module Api
  module V1
    class IssuesController < ApplicationController

      def index
        if params[:clientKey] == "OIUDFBOSU097098Y34IUBSFDV09898dvhsodfkjbaf93tb93rbrv"
          issues = Issue.order('created_at DESC')
          render json: {status:'SUCCESS',message:'Loaded issues',data:topics},status: :ok
      
        else
          render json: {status:'FAILURE',message:'Incorrect Password'},status: :bad_password
        end
      end

      def show
        if params[:clientKey] == "OIUDFBOSU097098Y34IUBSFDV09898dvhsodfkjbaf93tb93rbrv"
            issue = Issue.find_by(creator: params[:creatorId])
            render json: {status:'SUCCESS',message:'Loaded issue',data:topic},status: :ok
        else
            render json: {status:'FAILURE',message:'Incorrect Password'},status: :bad_password
        end
      end

      def create

        if params[:clientKey] == "OIUDFBOSU097098Y34IUBSFDV09898dvhsodfkjbaf93tb93rbrv"
          issue = Issue.new(topic_params)
          if issue.save
            render json: {status: 'SUCCESS', message: 'Saved Issue', data:issue},status: :ok
          else
            render json: {status: 'ERROR', message: 'User not saved', data:issue.error},status: :unprocessable_entity
          end
        else
            render json: {status:'FAILURE',message:'Incorrect Password'},status: :bad_password
        end
      end   
      private

      def issue_params
        params.permit(:creator, :text)
      end
    end
  end
end
