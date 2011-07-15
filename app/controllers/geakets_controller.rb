class GeaketsController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :create]

  def index
    
  end

  def show
    @geaket = Geaket.find(params[:id])
  end

  def new
    @geaket = Geaket.new
  end

  def create
    @geaket = User.find(1).geakets.create(params[:geaket])
    if @geaket.save
      flash[:success] = "Geaket added!"
      redirect_to :root
    else
      render 'new'
    end
  end
end
