class RequestsController < ApplicationController

  def index
    @client_ip = request.remote_ip

    puts @client_ip
    create
    @requests = Request.order('created_at DESC')
  end

  def create
  @request =
      Request.new(:ip => @client_ip)
  @request.save

  #else
    #redirect_to '/index'
  #end
end


end

