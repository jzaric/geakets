class PagesController < ApplicationController
  def index
    @geakets = Geaket.all(:order => "created_at DESC").paginate(:per_page => 10, :page => params[:page])
  end

  def about
  end

  def awesomest
    @geakets = Geaket.select('geakets.*, count(votes.geaket_id)').joins('LEFT JOIN votes ON geakets.id = votes.geaket_id').group(Geaket.column_names.map{|column| "#{Geaket.table_name}.#{column}"}.join(", ")).order('count(votes.geaket_id) DESC').paginate(:per_page => 10, :page => params[:page])
    render 'index'
  end
end
