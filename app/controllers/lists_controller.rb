class ListsController < ApplicationController
  def index
    @lists = List.all
    render :index
  end

  def new
    @list = List.new
    render :new
  end

  def show
    @list = List.find(params[:id])
    render :show
  end

  def edit
    @list = List.find(params[:id])
    render :edit
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to  lists_path
    else
      render :new
    end
  end

  def update
    @list= List.find(params[:id])
    if @list.update(list_params)
      redirect_to lists_path
    else
      render :edit
    end
  end

  private
  def list_params
    params.require(:list).permit(:name)
  end
end
