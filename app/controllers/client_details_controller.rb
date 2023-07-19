class ClientDetailsController < ApplicationController
  def index
    @client = Client.find(params[:client_id])
    @client_details = @client.client_details
    @client_detail = ClientDetail.new
  end

  def new
    @client_detail = ClientDetail.new
  end
end