require 'test_helper'

class FirstTest < ActiveSupport::TestCase
  test "esse é o meu primeiro teste" do
    variavel = 'Xita'

    assert_equal 'Xita', variavel
  end
end