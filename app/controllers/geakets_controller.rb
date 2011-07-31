class GeaketsController < ApplicationController
  include ActionView::Helpers::TextHelper
  
  before_filter :authenticate_user!, :only => [:new, :create, :patch, :vote]

  def index
    
  end

  def vote
    if user_signed_in?
      @geaket = Geaket.find(params[:id])
      if @geaket.voters.exists?(current_user)
        render :json => { :msg => "Already voted for this geaket!" }
      else
        @geaket.voters<<(current_user)
        render :json => { :success => true, :msg => "Voted successfully!", :label => pluralize(@geaket.voters.count, "vote") }
      end
    else
      render :json => { :msg => "Not signed in!"}
    end
  end

  def show
    @geaket = Geaket.find(params[:id])
    @geaket.view_count = (@geaket.view_count.nil? ? 0 : @geaket.view_count) + 1
    @geaket.save
    @patches = @geaket.children.paginate(:per_page => 10, :order => "created_at DESC", :page => params[:page])
  end

  def new
    @geaket = Geaket.new
  end

  def create
    @geaket = current_user.geakets.create(params[:geaket])
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
