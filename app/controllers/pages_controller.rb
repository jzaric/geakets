class PagesController < ApplicationController
  def index
    @geakets = Geaket.all(:order => "created_at DESC").paginate(:page => params[:page])
  end

  def about
  end

end
