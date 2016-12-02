class InformationController < ApplicationController
  before_action :set_information, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @information_search = Information.where(collection_id: session[:collection_id]).ransack(params[:q])
    @filtered_informations = @information_search.result(distinct:true).page(params[:page])
    respond_with(@information)
  end

  def show
    respond_with(@information)
  end

  def new
    @information = Information.new
    respond_with(@information)
  end

  def edit
  end

  def create
    params.permit!
    @information = Information.new(information_params.merge(:collection_id => session[:collection_id]))
    @information.save
    respond_with(@information)
  end

  def update
    params.permit!  
    @information.update(information_params)
    respond_with(@information)
  end

  def destroy
    @information.destroy
    respond_with(@information)
  end

  def showbycollectionid
    session[:collection_id] = params[:id]
    @information_search = Information.where(collection_id: params[:id]).ransack(params[:q])
    @filtered_informations = @information_search.result(distinct:true).page(params[:page])
    render 'index'
  end

  private
    def set_information
      @information = Information.find(params[:id])
    end

    def information_params
      params[:information]
    end
end
