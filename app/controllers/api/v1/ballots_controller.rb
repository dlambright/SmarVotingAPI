module Api
  module V1
    class BallotsController < ApplicationController
      def index
        ballots = Ballot.order('created_at DESC')
        #render json: {status:'SUCCESS',message:'Loaded ballots',data:ballots},status: :ok 
      end 
    
      def show
        if params[:clientKey] == "OIUDFBOSU097098Y34IUBSFDV09898dvhsodfkjbaf93tb93rbrv"
        ballot = Ballot.find_by(user: params[:user], issue: params[:issue])
            render json: {status:'SUCCESS',message:'Loaded ballot',data:ballot},status: :ok 
        else
            render json: {status:'FAILURE',message:'Incorrect Password'},status: :bad_password  
        end 
      end 

      def create
    
        if params[:clientKey] == "OIUDFBOSU097098Y34IUBSFDV09898dvhsodfkjbaf93tb93rbrv"
          ballot = Ballot.new(ballot_params)
          if ballot.save
            render json: {status: 'SUCCESS', message: 'Saved Ballot', data:ballot},status: :ok 
          else
            render json: {status: 'ERROR', message: 'Ballot not saved', data:ballot.error},status: :unprocessable_entity
          end 
        else
            render json: {status:'FAILURE',message:'Incorrect Password'},status: :bad_password  
        end 
      end 
    
      def destroy
        if params[:clientKey] == "OIUDFBOSU097098Y34IUBSFDV09898dvhsodfkjbaf93tb93rbrv"
          ballot = Ballot.find_by(user: params[:user], issue: params[:issue])
          ballot.destroy
          render json: {status: 'SUCCESS', message: 'Ballot deleted successfully', data:ballot},status: :ok 
        else
            render json: {status:'FAILURE',message:'Incorrect Password'},status: :bad_password  
        end 
      end 

      def update    
        if params[:clientKey] == "OIUDFBOSU097098Y34IUBSFDV09898dvhsodfkjbaf93tb93rbrv"

          ballot = Ballot.find_by(user: params[:user], issue: params[:issue])
          if ballot.update_attributes(ballot_params)
            render json: {status: 'SUCCESS', message: 'Saved Ballot', data:ballot},status: :ok 
          else
            render json: {status: 'ERROR', message: 'Ballot not updated', data:ballot.error},status: :unprocessable_entity
          end 
        else
            render json: {status:'FAILURE',message:'Incorrect Password'},status: :bad_password  
        end 
      end 
      private
  
      def ballot_params
        params.permit(:user, :issue, :voting_option)
      end 
    end 
  end 
end


