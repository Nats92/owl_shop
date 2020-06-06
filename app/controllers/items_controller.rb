class ItemsController < ApplicationController

  before_action :find_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all
  end

  def expensive
    @items = Item.where('price > ?', 20000)
    render "index"
  end

  # /items/id GET
  def show
    unless @item
      render text: 'Page not found', status: 404
    end
  end

  # /items/new GET
  def new
    @item = Item.new
  end

  # /items/id/edit GET
  def edit
  end

  # /items POST
  def create
    @item = Item.create(require_params)
    if @item.errors.empty?
      redirect_to item_path(@item)
    else
      render "new"
    end
  end

  # /items/id PUT
  def update
    @item.update_attributes(require_params)
    if @item.errors.empty?
      redirect_to item_path(@item)
    else
      render "edit"
    end
  end

  # /items/id/ DELETE
  def destroy
    @item.destroy
    redirect_to action: "index"
  end

  private
    def require_params
      params.require(:item).permit(:name, :price, :description)
    end

    def find_item
      @item = Item.where(id: params[:id]).first
      render_404 unless @item
    end

end
