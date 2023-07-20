class ClientDetailsController < ApplicationController
  before_action :authenticate_user!

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
    @client_detail.user = current_user

    if @client_detail.save
      redirect_to client_client_details_path(@client)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @client = Client.find(params[:client_id])
    @client_detail = @client.client_details.find(params[:id])
  end

  def update
    @client = Client.find(params[:client_id])
    @client_detail = @client.client_details.find(params[:id])

    if @client_detail.update(client_detail_params)
      redirect_to client_client_details_path(@client)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @client = Client.find(params[:client_id])
    @client_detail = @client.client_details.find(params[:id])
    @client_detail.destroy
    redirect_to client_client_details_path(@client)
  end

  private

  def client_detail_params
    params.require(:client_detail).permit(:title, :content, :user_id)
  end

  def client_detail_params
    params.require(:client_detail).permit(:title, :content)
  end

  def authenticate_user!
    redirect_to new_user_session_path unless user_signed_in?
  end
end