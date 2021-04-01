defmodule Exlivery.Users.AgentTest do
  use ExUnit.Case

  alias Exlivery.Users.Agent, as: UserAgent
  alias Exlivery.Users.User

  import Exlivery.Factory

  describe "save/1" do
    test "saves the user" do
      UserAgent.start_link(%{})

      user = build(:user)

      assert UserAgent.save(user) == :ok
    end
  end

  describe "get/1" do
    setup do
      UserAgent.start_link(%{})

      cpf = "78912345600"

      {:ok, cpf: cpf}
    end

    test "when the user is found, return the user", %{cpf: cpf} do
      :user
      |> build(cpf: cpf)
      |> UserAgent.save()

      response = UserAgent.get(cpf)

      expected_response =
        {:ok,
         %User{
           address: "Rua cidade jardim, 26",
           age: 22,
           cpf: "78912345600",
           email: "michel@rocketseat.com",
           name: "Michel"
         }}

      assert response == expected_response
    end

    test "when the user is not found, return an error" do
      response = UserAgent.get("00000000000")

      expected_response = {:error, "user not found"}

      assert response == expected_response
    end
  end
end
