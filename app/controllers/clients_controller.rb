class ClientsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @clients = current_user.clients
    @clients = sort_by_name(@clients)
  end

  def new
    @client = Client.new
  end

  def create
    @client = current_user.clients.build(client_params)

    if @client.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @client = Client.find(params[:id])
    if @client.user != current_user
      redirect_to clients_path
    end
  end

  def edit
    @client = Client.find(params[:id])
    if @client.user != current_user
      redirect_to clients_path
    end
  end

  def update
    @client = Client.find(params[:id])

    if @client.update(client_params)
      redirect_to client_path(@client)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    client = Client.find(params[:id])
    client.destroy
    client.client_details.destroy_all
    redirect_to clients_path
  end

  def sort_by_name(clients = [])
    origin = "ａ-ｚＡ-Ｚァ-ン０-９ぁぃぅぇぉがぎぐげござじずぜぞだぢづでどばびぶべぼぱぴぷぺぽゃゅょっゎァィゥェォガギグゲゴザジズゼゾダヂヅデドバビブベボパピプペポャュョッヮ"
    normalize = "a-zA-Zぁ-ん0-9あいうえおかきくけこさしすせそたちつてとはひふへほはひふへほやゆよつわあいうえおかきくけこさしすせそたちつてとはひふへほはひふへほやゆよつわ"

    clients.sort_by do |client|
      [client.client_lastname_kana.tr(origin, normalize), client.client_firstname_kana.tr(origin, normalize)]
    end
  end

  
  private
  def client_params
    params.require(:client).permit(:client_firstname, :client_lastname, :client_firstname_kana, :client_lastname_kana, :birthday, :gender_id, :post_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :mobile_number, :company_name, :project, :note)
  end

end