module Api
  module V1
    class SubscriptionsController < ApplicationController

      def index
        subscriptions = Subscription.order('created_at DESC')
        #render json: {status:'SUCCESS',message:'Loaded subscriptions',data:subscriptions},status: :ok
      end
      
      def show
        if params[:clientKey] == "OIUDFBOSU097098Y34IUBSFDV09898dvhsodfkjbaf93tb93rbrv"
            subscription= Subscription.where(user: params[:user])
            #subscription= Subscription.find_by(user: params[:user])
            render json: {status:'SUCCESS',message:'Loaded subscription',data:subscription},status: :ok
        else
            render json: {status:'FAILURE ON SHOW',message:'Incorrect Password'},status: :bad_password
        end

      end
      
      def create
        subscription = Subscription.new(subscription_params)

        if params[:clientKey] == "OIUDFBOSU097098Y34IUBSFDV09898dvhsodfkjbaf93tb93rbrv"
          if subscription.save
            render json: {status: 'SUCCESS', message: 'Saved Subscription', data:subscription},status: :ok
          else
            render json: {status: 'ERROR', message: 'Subscription not saved', data:subscription.error},status: :unprocessable_entity
          end
        else
            render json: {status:'FAILURE ON SHOW',message:'Incorrect Password'},status: :bad_password
        end

      end
      
      def destroy
        if params[:clientKey] == "OIUDFBOSU097098Y34IUBSFDV09898dvhsodfkjbaf93tb93rbrv"
          #subscription = Subscription.where(user: params[:user], topic: params[:issue])
          subscription = Subscription.find_by(user: params[:user], issue: params[:issue])
          subscription.destroy
          render json: {status: 'SUCCESS', message: 'Subscription deleted successfully', data:subscription},status: :ok
      
        else
            render json: {status:'FAILURE ON SHOW',message:'Incorrect Password'},status: :bad_password
        end

      end

      private
  
      def subscription_params
        params.permit(:user, :issue)
      end

    end
  end
end
