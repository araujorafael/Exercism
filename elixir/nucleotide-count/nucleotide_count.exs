defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    count(strand, nucleotide, 0)
  end

  @spec count([char], char, integer) :: non_neg_integer
  def count([nucleotideTest | strand], nucleotide, accumulator) do
    if nucleotideTest == nucleotide do
      count(strand, nucleotide, accumulator + 1)
    else
      count(strand, nucleotide, accumulator)
    end
  end

  def count([], _, accumulator) do
    accumulator
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    totalCount =
      @nucleotides
      |> Enum.map(fn nucleotide -> {nucleotide, 0} end)
      |> Map.new()

    histogram(strand, totalCount)
  end

  @spec histogram([char], map) :: map
  def histogram([nucleotide | strand], count) do
    if Enum.member?(@nucleotides, nucleotide) do
      updatedCount = Map.update!(count, nucleotide, &(&1 + 1))
      histogram(strand, updatedCount)
    else
      histogram(strand, count)
    end
  end

  def histogram([], count) do
    count
  end
end
