class ClientsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    def show
        client = Client.find(params[:id])
        render json: client, status: :ok
    end

    private

    def record_not_found(error)
        render json: {errors: {error.model => "not found"}}, status: :not_found
    end
end
