defmodule MyApi.TasksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `MyApi.Tasks` context.
  """

  @doc """
  Generate a task.
  """
  def task_fixture(attrs \\ %{}) do
    {:ok, task} =
      attrs
      |> Enum.into(%{
        code: "some code",
        name: "some name",
        priority: 42
      })
      |> MyApi.Tasks.create_task()

    task
  end
end
