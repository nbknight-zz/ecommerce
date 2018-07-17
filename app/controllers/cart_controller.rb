class CartController < ApplicationController
	before_action :authenticate_user!, only: [:checkout]

  def add_to_cart
  	line_item = LineItem.create(product_id: params[:product_id], quantity: params[:quantity])
  	line_item.update(line_item_total: (line_item.quantity * line_item.product.price))

  	redirect_to root_url
  end

  def delete_from_cart

    line_item = LineItem.find(params[:line_item_id])
    line_item.destroy

    redirect_to root_url

  end

  def view_order
    @line_items = LineItem.all
  end

  def checkout
  end
end
