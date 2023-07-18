class ClientsController < ApplicationController
  def index
    @clients = Client.all
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)

    if @client.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @client = Client.find(params[:id])
  end

  
  private
  def client_params
    params.require(:client).permit(:client_firstname, :client_lastname, :client_firstname_kana, :client_lastname_kana, :birthday, :gender_id, :post_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :mobile_number, :company_name, :project, :note)
  end

end