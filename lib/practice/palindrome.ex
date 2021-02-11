defmodule Practice.Palindrome do
  def palindrome?(str) do
  
    # Remove case
    formatted = String.downcase(str)
    
    # Remove punctuation and whitespace for phrases
    formatted = String.replace(formatted, [",", ".", "!", "?", "\'", "(", ")", "`", " "], "")
    
    # Check if palindrome
    formatted == String.reverse(formatted)
    
  end
end
