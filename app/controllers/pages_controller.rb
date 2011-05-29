class PagesController < ApplicationController
  def index
    @geakets = Geaket.all
  end

  def about
  end

end
