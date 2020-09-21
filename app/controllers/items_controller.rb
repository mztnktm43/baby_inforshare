class ItemsController < ApplicationController
  before_action :move_to_new, only: [:new, :create]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @item = Item.find(params[:id])
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render 'edit'
    end
  end

  def search
    @items = Item.search(params[:keyword])
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :detail, :category_id, :age_year_id, :age_month_id, :size, :price).merge(user_id: current_user.id)
  end

  def move_to_new
    redirect_to action: :index unless user_signed_in?
  end
end
