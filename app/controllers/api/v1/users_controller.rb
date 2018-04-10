module Api
  module V1
    class UsersController < ApplicationController

      def index
      	users = User.order('created_at DESC')
        #render json: {status:'SUCCESS',message:'Loaded users',data:users},status: :ok
      end
      
      def show
        if params[:clientKey] == "OIUDFBOSU097098Y34IUBSFDV09898dvhsodfkjbaf93tb93rbrv"
	    user = User.find_by(username: params[:username], password: params[:password])
            render json: {status:'SUCCESS',message:'Loaded user',data:user},status: :ok
	else
            render json: {status:'FAILURE',message:'Incorrect Password'},status: :bad_password	
	end
      end

      def create
        
        if params[:clientKey] == "OIUDFBOSU097098Y34IUBSFDV09898dvhsodfkjbaf93tb93rbrv"
	  user = User.new(user_params)
          if user.save
            render json: {status: 'SUCCESS', message: 'Saved User', data:user},status: :ok
          else
            render json: {status: 'ERROR', message: 'User not saved', data:user.error},status: :unprocessable_entity
          end
	else
            render json: {status:'FAILURE',message:'Incorrect Password'},status: :bad_password	
	end
      end
      
      def destroy
        if params[:clientKey] == "OIUDFBOSU097098Y34IUBSFDV09898dvhsodfkjbaf93tb93rbrv"
          user = User.find(params[:id])
          user.destroy
          render json: {status: 'SUCCESS', message: 'User deleted successfully', data:user},status: :ok
	else
            render json: {status:'FAILURE',message:'Incorrect Password'},status: :bad_password	
	end
      end

      def update
        
        if params[:clientKey] == "OIUDFBOSU097098Y34IUBSFDV09898dvhsodfkjbaf93tb93rbrv"

	  user = User.find(params[:id])
          if user.update_attributes(user_params)
            render json: {status: 'SUCCESS', message: 'Saved User', data:user},status: :ok
          else
            render json: {status: 'ERROR', message: 'User not updated', data:user.error},status: :unprocessable_entity
          end
	else
            render json: {status:'FAILURE',message:'Incorrect Password'},status: :bad_password	
	end
      end
      
      private
  
      def user_params
        params.permit(:username, :password)
      end









    end
  end
end
