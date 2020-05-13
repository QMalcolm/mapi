defmodule Mapi.PizzaReviews.PizzaReview do
    @moduledoc """
    Each pizza review is a review of a place that sells pizza! Mmmmmmmm pizza...
    """
    use Ecto.Schema
    import Ecto.Changeset

    @primary_key {:id, :binary_id, autogenerate: true}
    @derive {Jason.Encoder, only: [:id, :name, :address, :website, :phone, :score, :body]}
    schema "pizzareviews" do
        field :name, :string
        field :address, :string
        field :website, :string
        field :phone, :string
        field :score, :float
        field :body, :string
        field :published, :boolean
        field :findable, :boolean

        timestamps()
    end

    @doc false
    def changeset(%__MODULE__{} = pizza_review, attrs \\ %{}) when is_map(attrs) do
        pizza_review
        |> cast(attrs, [:name, :address, :website, :phone, :score, :body, :findable, :published])
        |> validate_length(:name, max: 256)
    end

    # def delete_changeset(%__MODULE__{} = review) do
    #     review
    #     |> put_change(:name, nil)
    #     |> 
    # end

    # defp nilify(%__MODULE__{} = review, fields \\ []) when is_arry(fields) do
    # end
end