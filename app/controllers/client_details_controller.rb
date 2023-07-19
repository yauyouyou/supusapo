class ClientDetailsController < ApplicationController
  def index
    @client = Client.find(params[:client_id])
    @client_details = @client.client_details
    @client_detail = ClientDetail.new
  end

  def new
    @client = Client.find(params[:client_id])
    @client_detail = ClientDetail.new
  end

  def create
    @client = Client.find(params[:client_id])
    @client_detail = @client.client_details.build(client_detail_params)

    if @client_detail.save
      redirect_to client_client_details_path(@client)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def client_detail_params
    params.require(:client_detail).permit(:title, :content)
  end
end