class GeaketsController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :create, :patch]

  def index
    
  end

  def show
    @geaket = Geaket.find(params[:id])
    @patches = @geaket.children.paginate(:per_page => 2, :order => "created_at DESC", :page => params[:page])
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

  def patch
    @geaket = current_user.geakets.create(params[:geaket])
    if(@geaket.save)
      flash[:sucess] = "Patch added"
      redirect_to :root
    else
      render 'patch'
    end
  end
end
