class PagesController < ApplicationController
  def index
    @geakets = Geaket.select('geakets.*, count(votes.geaket_id) as vote_count').joins('LEFT JOIN votes ON geakets.id = votes.geaket_id').group(Geaket.column_names.map{|column| "#{Geaket.table_name}.#{column}"}.join(", ")).order('vote_count DESC').paginate(:page => params[:page])
  end

  def about
  end

  def latest
    @geakets = Geaket.all(:order => "created_at DESC").paginate(:page => params[:page])
    render 'index'
  end
end
