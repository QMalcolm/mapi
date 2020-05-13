defmodule Mapi.Repo.Migrations.CreatePizzareviews do
  use Ecto.Migration

  def change do
    create table(:pizzareviews, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string
      add :address, :string
      add :website, :string
      add :phone, :string
      add :score, :float
      add :body, :string
      add :published, :boolean, default: false
      add :findable, :boolean, default: true

      timestamps()
    end
  end
end
