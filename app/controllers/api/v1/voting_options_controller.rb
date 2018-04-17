module Api 
  module V1
    class VotingOptionsController < ApplicationController

      def index
        voting_options = VotingOption.order('created_at DESC')
        #render json: {status:'SUCCESS',message:'Loaded voting_options',data:voting_options},status: :ok
      end 

      def show
        if params[:clientKey] == "OIUDFBOSU097098Y34IUBSFDV09898dvhsodfkjbaf93tb93rbrv"
            voting_option= VotingOption.where(issue: params[:issue])
            #voting_option= VotingOption.find_by(voting_option: params[:voting_option])
            render json: {status:'SUCCESS',message:'Loaded voting_option',data:voting_option},status: :ok 
        else
            render json: {status:'FAILURE ON SHOW',message:'Incorrect Password'},status: :bad_password
        end 

      end 

      def create
        if params[:clientKey] == "OIUDFBOSU097098Y34IUBSFDV09898dvhsodfkjbaf93tb93rbrv"
          voting_option = VotingOption.new(voting_option_params)

          if voting_option.save
            render json: {status: 'SUCCESS', message: 'Saved VotingOption', data:voting_option},status: :ok 
          else
            render json: {status: 'ERROR', message: 'VotingOption not saved', data:voting_option.error},status: :unprocessable_entity
          end 
        else
            render json: {status:'FAILURE ON SHOW',message:'Incorrect Password'},status: :bad_password
        end 
      end

     def update
    
        if params[:clientKey] == "OIUDFBOSU097098Y34IUBSFDV09898dvhsodfkjbaf93tb93rbrv"
          voting_option = VotingOption.find(params[:id])
          if voting_option.update_attributes(voting_option_params)
            render json: {status: 'SUCCESS', message: 'Saved User', data:voting_option},status: :ok 
          else
            render json: {status: 'ERROR', message: 'User not updated', data:voting_option.error},status: :unprocessable_entity
          end 
       else
            render json: {status:'FAILURE',message:'Incorrect Password'},status: :bad_password  
    end 
      end  

      def destroy
        if params[:clientKey] == "OIUDFBOSU097098Y34IUBSFDV09898dvhsodfkjbaf93tb93rbrv"
          #voting_option = VotingOption.where(voting_option: params[:voting_option], topic: params[:issue])
          voting_option = VotingOption.find_by(id: params[:id])
          voting_option.destroy
          render json: {status: 'SUCCESS', message: 'VotingOption deleted successfully', data:voting_option},status: :ok 
        else
            render json: {status:'FAILURE ON SHOW',message:'Incorrect Password'},status: :bad_password
        end  
      end 

      private

      def voting_option_params
        params.permit(:issue, :name, :desc, :vote_count)
      end 

    end 
  end 
end
