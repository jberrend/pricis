defmodule Pricis.TokenGenerator do
  def generate_token(length \\ 10) do
    alphabet = Enum.to_list(?a..?z) ++ Enum.to_list(?0..?9)
    List.to_string(Enum.take_random(alphabet, length))
  end
end
