defmodule ValidParenthesesTest do
  use ExUnit.Case
  import ValidParentheses, only: [valid_parentheses: 1]

  test "valid_parentheses" do
    assert valid_parentheses("()") == true
    assert valid_parentheses(")(()))") == false
    assert valid_parentheses("(") == false
    assert valid_parentheses("(())((()())())") == true
  end
end
