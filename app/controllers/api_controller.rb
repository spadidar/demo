class ApiController < ApplicationController
  
  def store
    data = params["data"]
    
    render :nothing => true, :status => 200, :content_type => 'text/html'
  end

  def show
  end

end
