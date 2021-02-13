defmodule Practice.Calc do
  def parse_float(text) do
    {num, _} = Float.parse(text)
    num
  end

  # Get index of highest priority operator (M->D->A->S)
  def get_highest_priority(expr) do
    Enum.find_index(expr, &String.equivalent?(&1, "-")) # Lowest
    || Enum.find_index(expr, &String.equivalent?(&1, "+"))
    || Enum.find_index(expr, &String.equivalent?(&1, "/"))
    || Enum.find_index(expr, &String.equivalent?(&1, "*")) # Highest
  end
  
  # Modified from Evaluation of Expression Tree algorithm
  # Attribution: https://www.geeksforgeeks.org/evaluation-of-expression-tree/

  # Base case
  defp eval_expr_tree([num]) do
    parse_float(num)
  end

  # Build tree recursively
  defp eval_expr_tree(expr) do
    index = get_highest_priority(expr)
    left = Enum.slice(expr, 0..(index - 1))
    right = Enum.slice(expr, (index + 1)..Enum.count(expr))
    eval(eval_expr_tree(left), Enum.at(expr, index), eval_expr_tree(right))
  end
  
  # Base case
  defp eval(num) do
    num
  end

  # Evaluate expression recursively
  defp eval(a, op, b) do
    case op do
      "*" -> eval(a) * eval(b)
      "/" -> eval(a) / eval(b)
      "+" -> eval(a) + eval(b)
      "-" -> eval(a) - eval(b)
    end
  end

  # Main
  def calc(expr) do
    expr
    |> String.split(~r/\s+/)
    |> eval_expr_tree
  end
end
