class ApiController < ApplicationController
  
  def store
    data = params["data"]
    Officer.store data
    render :nothing => true, :status => 200, :content_type => 'text/html'
  end

  def show
    @officers = Officer.all
  end

end
