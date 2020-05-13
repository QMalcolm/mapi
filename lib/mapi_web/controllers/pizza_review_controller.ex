defmodule MapiWeb.PizzaReviewController do
    use MapiWeb, :controller

    alias Mapi.PizzaReviews
    alias Mapi.PizzaReviews.PizzaReview

    action_fallback MapiWeb.FallbackController

    def index(conn, _params) do
        pizzareviews = PizzaReviews.list_pizzareviews()
        render(conn, "index.json", pizzareviews: pizzareviews)
    end

    def create(conn, %{"pizza_review" => pizza_review_params}) do
        with {:ok, %PizzaReview{} = pizza_review} <- PizzaReviews.create_pizza_review(pizza_review_params) do
            conn
            |> put_status(:create)
            |> put_resp_header("location", Routes.pizza_review_path(conn, :show, pizza_review))
            |> render("show.json", pizza_review: pizza_review)
        end
    end

    def show(conn, %{"id" => id}) do
        pizza_review = PizzaReviews.get_pizza_review!(id)
        render(conn, "show.json", pizza_review: pizza_review)
    end

    def update(conn, %{"id" => id, "pizza_review" => pizza_review_params}) do
        pizza_review = PizzaReviews.get_pizza_review!(id)

        with {:ok, %PizzaReview{} = pizza_review} <- PizzaReviews.update_pizza_review(pizza_review, pizza_review_params) do
            render(conn, "show.json", pizza_review: pizza_review)
        end
    end

    def delete(conn, %{"id" => id}) do
        pizza_review = PizzaReviews.get_pizza_review!(id)

        with {:ok, %PizzaReview{}} <- PizzaReviews.delete_pizza_review(pizza_review) do
            send_resp(conn, :no_content, "")
        end
    end
end