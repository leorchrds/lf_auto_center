require 'test_helper'

class UsersBackoffice::ServiceOrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_backoffice_service_orders_index_url
    assert_response :success
  end

end
