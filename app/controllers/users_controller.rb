class UsersController < ApplicationController
  def geakets
    @user = User.find(params[:id])
    @geakets = @user.geakets.order("created_at DESC").paginate(:per_page => 10, :page => params[:page]) #Geaket.all(:order => "created_at DESC").paginate(:per_page => 10, :page => params[:page])
  end

end
