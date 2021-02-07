class InfomationsController < ApplicationController
  def index
    @infomations = Infomation.all.order("id DESC").page(params[:page]).per(10)
  end

  def show
  end

  def new
    @infomation = Infomation.new
  end

  def create
    @infomation = Infomation.create(infomation_params)
    @infomation.save
    redirect_to '/'
  end

  def edit
    @infomation = Infomation.find(params[:id])
  end

  def update
    infomation = Infomation.find(params[:id])
    infomation.update(infomation_params)
    redirect_to '/'
  end

  def destroy
    @infomation = Infomation.find(params[:id])
    @infomation.destroy
    redirect_to "/"
  end

  private
    def infomation_params
      params.require(:infomation).permit(:title, :info)
    end

end
