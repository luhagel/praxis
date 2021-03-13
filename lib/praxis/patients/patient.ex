defmodule Praxis.Patients.Patient do
  use Ecto.Schema
  import Ecto.Changeset

  schema "patients" do
    field :avatar_url, :string
    field :date_of_birth, :date
    field :first_name, :string
    field :last_name, :string

    timestamps()
  end

  @doc false
  def changeset(patient, attrs) do
    patient
    |> cast(attrs, [:first_name, :last_name, :avatar_url, :date_of_birth])
    |> validate_required([:first_name, :last_name, :avatar_url, :date_of_birth])
  end
end
