class ItemsController < ApplicationController
  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def creat
    Item.create(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    # @item = Item.new(item_id)
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
  end


  private

  def item_params
    params.require(:item).permit(:name, :detail, :category_id, :age_yasr_id, :age_month_id, :size, :price).merge(user_id: current_user_id)
  end
end
