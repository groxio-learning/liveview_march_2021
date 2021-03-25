defmodule Recallr.Library.Passage do
  use Ecto.Schema
  import Ecto.Changeset

  schema "passages" do
    field :name, :string
    field :rounds, :integer
    field :text, :string

    timestamps()
  end

  @doc false
  def changeset(passage, attrs) do
    passage
    |> cast(attrs, [:rounds, :name, :text])
    |> validate_required([:rounds, :name, :text])
    |> validate_length(:name, min: 4)
    # |> unique_constraint(:name)
  end
end
