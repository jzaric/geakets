class TagsController < ApplicationController
  def geakets
    @tag = Tag.find(params[:id])
    @geakets = @tag.geakets.order("created_at DESC").paginate(:per_page => 10, :page => params[:page])
  end
end
