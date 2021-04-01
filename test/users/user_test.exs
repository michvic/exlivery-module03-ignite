defmodule Exlivery.Users.UserTest do
  use ExUnit.Case

  alias Exlivery.Users.User

  import Exlivery.Factory

  describe "build/5" do
    test "when all params are valid, returns the user" do
      response =
        User.build(
          "Rua cidade jardim, 26",
          "Michel",
          "michel@rocketseat.com",
          "11122233344",
          22
        )

      expected_response = {:ok, build(:user)}

      assert response == expected_response
    end

    test "when there are invlid params, returns an error" do
      response =
        User.build(
          "Rua cidade jardim",
          "Michel Jr",
          "michel@rocketseat.com",
          "11122233344",
          15
        )

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
