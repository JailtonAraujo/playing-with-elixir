defmodule MyApi.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :code, :string
      add :priority, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
