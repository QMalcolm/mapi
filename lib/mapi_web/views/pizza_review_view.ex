defmodule MapiWeb.PizzaReviewView do
    use MapiWeb, :view
    alias MapiWeb.PizzaReviewView

    def render("index.json", %{pizzareviews: pizzareviews}) do
        %{data: render_many(pizzareviews, PizzaReviewView, "pizza_review.json")}
    end

    def render("show.json", %{pizza_review: pizza_review})do
        %{data: render_one(pizza_review, PizzaReviewView, "pizza_review.json")}
    end

    def render("pizza_review.json", %{pizza_review: pizza_review}) do
        pizza_review
    end
end