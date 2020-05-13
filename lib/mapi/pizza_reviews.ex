defmodule Mapi.PizzaReviews do
    @moduledoc """
    The PizzaReviews context.
    """
    import Ecto.Query, warn: false
    alias Mapi.Repo

    alias Mapi.PizzaReviews.PizzaReview

    @doc """
    Creates a pizza_review.

    ## Examples

        iex> create_pizza_review(%{field: value})
        {:ok, %PizzaReview{}}

        iex> create_pizza_review(%{field: bad_value})
        {:error, %Ecto.Changeset{}}
    """
    def create_pizza_review(%{} = attrs) when is_map(attrs) do
        %PizzaReview{}
        |> PizzaReview.changeset(attrs)
        |> Repo.insert()
    end

    @doc """
    Updates a pizza_review.

    ## Examples

        iex> update_pizza_review(pizza_review, %{field: new_value})
        {:ok, %PizzaReview{}}

        iex> update_pizza_review(pizza_review, %{field: bad_value})
        {:error, %Ecto.Changeset{}}

    """
    def update_pizza_review(%PizzaReview{} = pizza_review, attrs) when is_map(attrs) do
        pizza_review
        |> PizzaReview.changeset(attrs)
        |> Repo.update()
    end

    @doc """
    Gets a single pizza_review.
    
    Raises `Ecto.NoResultsError` if the Pizza review does not exist.

    ## Examples

        iex> get_pizza_review!(asbld82384a)
        %PizzaReview{}

        iex> get_pizza_review!(asbld823as4)
        ** (Ecto.NoResultsError)
    """
    def get_pizza_review!(id) when is_bitstring(id), do: Repo.get!(PizzaReview, id)

    @doc """
    Returns the list of pizzareviews.
    
    ## Examples
        iex> list_pizzareviews()
        [%PizzaReview{}, ...]
    """
    def list_pizzareviews(), do: Repo.all(PizzaReview)

    @doc """
    Returns an `%Ecto.Changeset{}` for tracking pizza_review changes.

    ## Examples

        iex> change_pizza_review(pizza_review)
        %Ecto.Changeset{data: %PizzaReview{}}

    """
    def change_pizza_review(%PizzaReview{} = pizza_review, attrs \\ %{}) do
        PizzaReview.changeset(pizza_review, attrs)
    end

    @doc """
    Deletes a pizza_review.

    ## Examples

        iex> delete_pizza_review(pizza_review)
        {:ok, %PizzaReview{}}

        iex> delete_pizza_review(pizza_review)
        {:error, %Ecto.Changeset{}}
    """
    def delete_pizza_review(%PizzaReview{} = pizza_review) do
        Repo.delete(pizza_review)
    end
end