defmodule Doggygram.TestHelpers do
  alias Doggygram.Repo

  def insert_user(attrs \\ %{}) do
    changes = Enum.into(attrs, %{
      name: "Some User",
      username: "user#{Base.encode16(:crypto.strong_rand_bytes(8))}",
      password: "supersecret",
      })

      %Doggygram.User{}
      |> Doggygram.User.registration_changeset(changes)
      |> Repo.insert!()
    end

    def insert_video(user, attrs \\ %{}) do
      user
      |> Ecto.build_assoc(:videos, attrs)
      |> Repo.insert!()
    end
  end
