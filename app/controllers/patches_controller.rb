class PatchesController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :create]
  def new
    @geaket = Geaket.new
    @geaket.parent = Geaket.find(params[:geaket_id])
    #@geaket.title = "Patch"
  end

  def create
    @geaket = current_user.geakets.create(params[:geaket])
    @geaket.title = "Patch"
    @geaket.parent = Geaket.find(params[:geaket_id])
    if @geaket.save
      flash[:success] = "Patch added!"
      redirect_to geaket_path(@geaket.parent)
    else
      render 'new'
    end
  end
end
