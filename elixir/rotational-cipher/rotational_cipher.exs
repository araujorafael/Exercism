 defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """

  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text |> String.to_charlist |> Enum.map(&add(&1, shift)) |> List.to_string
  end

  ?a = 97
  ?z = 122
  def add(char, n) when char in ?a..?z do
    rem((char - ?a + n), 26) + ?a
  end

  ?A = 65
  ?Z = 90
  def add(char, shift) when char in ?A..?B do
    rem((char - ?A + shift), 26) + ?A
  end

  def add(char, _), do: char
end
