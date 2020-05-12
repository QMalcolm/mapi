defmodule Mapi.Repo.Migrations.PizzaReview do
  use Ecto.Migration

  def change do
    create table(:pizza_review, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string
      add :address, :string
      add :website, :string
      add :phone, :string
      add :score, :float
      add :body, :string
      add :published, :boolean, default: false
      add :findable, :boolean, default: true
      add :deleted_at, :naive_datetime, default: nil

      timestamps()
    end
  end
end
