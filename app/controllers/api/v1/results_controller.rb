module Api
  module V1
    class ResultsController < ApplicationController

      def show
        if params[:clientKey] == "OIUDFBOSU097098Y34IUBSFDV09898dvhsodfkjbaf93tb93rbrv"
            voting_option= VotingOption.where(issue: params[:issue])
            #voting_option= VotingOption.find_by(voting_option: params[:voting_option])
            render json: {status:'SUCCESS',message:'Loaded voting_option',data:voting_option},status: :ok
        else
            render json: {status:'FAILURE ON SHOW',message:'Incorrect Password'},status: :bad_password
        end

      end

      private

      def result_params
        params.permit(:issue, :name, :desc, :vote_count)
      end

    end
  end
end

