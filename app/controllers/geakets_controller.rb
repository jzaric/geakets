class GeaketsController < ApplicationController
  def index
    
  end

  def show
    
  end

  def new
    @geaket = Geaket.new
  end

  def create
    @geaket = Geaket.create(params[:geaket])
    if @geaket.save
      flash[:success] = "Geaket added!"
      redirect_to :root
    else
      render 'new'
    end
  end
end
