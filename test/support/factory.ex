defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Users.User
  alias Exlivery.Orders.{Item, Order}

  def user_factory do
    %User{
      address: "Rua cidade jardim, 26",
      age: 22,
      cpf: "11122233344",
      email: "michel@rocketseat.com",
      name: "Michel"
    }
  end

  def item_factory do
    %Item{
      description: "Pizza de peperoni",
      category: :pizza,
      quantity: 1,
      unity_price: Decimal.new("35.5")
    }
  end

  def order_factory do
    %Order{
      delivery_address: "Rua cidade jardim, 26",
      items: [
        build(:item),
        build(:item,
          description: "Temaki de atum",
          category: :japonesa,
          quantity: 2,
          unity_price: Decimal.new("20.50")
        )
      ],
      total_price: Decimal.new("76.50"),
      user_cpf: "11122233344"
    }
  end

  def item_map_factory do
    %{
      description: "Pizza de peperoni",
      category: :pizza,
      quantity: 1,
      unity_price: "35.5"
    }
  end
end
