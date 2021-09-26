defmodule TestingEcto.Schemas.UserBasicSchema do
  use Ecto.Schema
  import Ecto.Changeset

  @optional_fields [:favorite_number]

  @primary_key false
  embedded_schema do
    field(:date_of_birth, :date)
    field(:email, :string)
    field(:favorite_number, :float)
    field(:first_name, :string)
    field(:last_name, :string)
    field(:phone_number, :string)
  end

  defp all_fields do
    __MODULE__.__schema__(:fields)
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, all_fields())
    |> validate_required(all_fields() -- @optional_fields)
  end
end