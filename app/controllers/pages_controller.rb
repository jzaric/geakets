class PagesController < ApplicationController
  def index
    @geakets = Geaket.find(:all, :select => 'geakets.*, count(votes.geaket_id) as vote_count',:joins => 'left outer join votes on geakets.id = votes.geaket_id', :group => 'geakets.id', :order => 'vote_count DESC').paginate(:page => params[:page])
  end

  def about
  end

  def latest
    @geakets = Geaket.all(:order => "created_at DESC").paginate(:page => params[:page])
    render 'index'
  end
end
