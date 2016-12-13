defmodule OdtPotionTest do
  use ExUnit.Case
  doctest OdtPotion

  test "substuting variables in a document" do
    path = "test/sample_files/letter_to_you.odt"
    result = OdtPotion.replace_in_pdf(path, "[NAME]", "Donald Trump")
  end

  test "substituting a map of variables with their values"
end
