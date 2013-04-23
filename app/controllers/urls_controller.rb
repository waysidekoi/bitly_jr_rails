class UrlsController < ApplicationController
  def create
    long_url = params[:url][:full_url].downcase
    shortened_url = (0...8).map{(65+rand(26)).chr}.join
    @url = Url.new
    @url.full_url = long_url
    @url.shortened_url = shortened_url

    if @url.save
      render :new
    else
      flash[:notice] = @url.errors.full_messages.join("")
      redirect_to root_path
    end
  end

  def show
    url = Url.find_by_shortened_url(params[:id])
    
    unless url.nil?
      puts url.full_url
      redirect_to url.full_url
    else
      flash[:notice] = "Invalid shortened URL"
      redirect_to root_path
    end    
  end

end
