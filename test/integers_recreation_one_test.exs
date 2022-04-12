defmodule IntegersRecreationOneTest do
  use ExUnit.Case

  test "Example Tests" do
    assert IntegersRecreationOne.call(1, 250) == [{1, 1}, {42, 2500}, {246, 84100}]
    assert IntegersRecreationOne.call(42, 250) == [{42, 2500}, {246, 84100}]
    assert IntegersRecreationOne.call(250, 500) == [{287, 84100}]
  end
end
