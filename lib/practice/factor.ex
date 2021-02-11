defmodule Practice.Factor do
  def factor(num) do
    factorize(num, 2)
  end
  
  # Adapted from Rosetta Code Prime Decomposition Algorithm
  # Attribution: https://rosettacode.org/wiki/Prime_decomposition#Elixir
  
  defp factorize(num, fct) do
    cond do
    
      # Base case
      fct * fct > num -> [num]
      
      # Is a factor: cons to list, divide and recurse
      rem(num, fct) == 0 -> [fct | factorize(div(num, fct), fct)]
      
      # Else: increment factor and recurse
      true -> factorize(num, fct + 1)
      
    end
  end
end
