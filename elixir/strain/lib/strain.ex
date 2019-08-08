defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def keep(list, fun) when length(list) > 0 do
    [item | newList] = list

    cond do
      fun.(item) ->
        [item] ++ keep(newList, fun)
      true ->
        keep(newList, fun)
    end
  end

  def keep([], _), do: []

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def discard(list, fun) when length(list) > 0 do
    [item | newList] = list

    cond do
      fun.(item) ->
        discard(newList, fun)
      true ->
        [item] ++ discard(newList, fun)
    end
  end

  def discard([], _), do: []
end
