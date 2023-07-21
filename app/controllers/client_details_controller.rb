class ClientDetailsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_client, only: [:index]

  def index
    if @client
      @client_details = @client.client_details
      @client_detail = ClientDetail.new
    else
      redirect_to new_user_session_path
    end
  end

  def new
    @client = Client.find(params[:client_id])
    @client_detail = ClientDetail.new
  end

  def create
    @client = Client.find(params[:client_id])
  
    if @client.user == current_user
      @client_detail = @client.client_details.build(client_detail_params)
      @client_detail.user = current_user
  
      if @client_detail.save
        redirect_to client_client_details_path(@client)
      else
        render :new, status: :unprocessable_entity
      end
    else
      redirect_to new_user_session_path, alert: "このクライアントの詳細情報にアクセスする権限がありません。"
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
    params.require(:client_detail).permit(:title, :content)
  end

  def find_client
    @client = Client.find_by(id: params[:client_id], user_id: current_user.id)
  end
end