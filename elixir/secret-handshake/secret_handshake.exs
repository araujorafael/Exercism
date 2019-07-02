defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  require Bitwise

  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    list =
      [{1, "wink"}, {2, "double blink"}, {4, "close your eyes"}, {8, "jump"}]
      |> Enum.reduce([], fn val, acc ->
        cond do
          Bitwise.band(code, elem(val, 0)) > 0 ->
            acc ++ [elem(val, 1)]

          true ->
            acc
        end
      end)

    if Bitwise.band(code, 0b10000) > 0 do
      Enum.reverse(list)
    else
      list
    end
  end
end
