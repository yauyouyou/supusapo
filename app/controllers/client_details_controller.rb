class ClientDetailsController < ApplicationController
  def index
    @client_details = ClientDetail.all
  end
end
