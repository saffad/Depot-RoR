require 'test_helper'

class StoreControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_select '#columns #side a', minimum: 1
    assert_select '#main .entry', 3
    assert_select 'h3', 'MyStringBy MyString'
    assert_select '.price', "&pound;9.99"
  end

end
