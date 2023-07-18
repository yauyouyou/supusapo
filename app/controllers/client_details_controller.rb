class ClientDetailsController < ApplicationController
  def index
    @client_details = Client_details.all
  end
end
