class PagesController < ApplicationController
  def index
    @geakets = Geaket.paginate(:page => params[:page])
  end

  def about
  end

end
