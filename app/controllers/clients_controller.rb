class ClientsController < ApplicationController
  def index
    @clients = Client.all
  end

  def new
    @client = Client.new
  end

  def create
    Client.create(client_params)
    redirect_to '/'
  end

  
  private
  def client_params
    params.require(:client).permit(:client_firstname, :client_lastname, :client_firstname_kana, :client_lastname_kana, :birthday, :gender_id, :post_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :mobile_number, :company_name, :project, :note)
  end
  
end