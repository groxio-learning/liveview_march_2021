defmodule Recallr.Repo.Migrations.CreatePassages do
  use Ecto.Migration

  def change do
    create table(:passages) do
      add :rounds, :integer
      add :name, :string
      add :text, :text

      timestamps()
    end

  end
end
