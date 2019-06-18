require 'test_helper'

class SearchesControllerTest < ActionDispatch::IntegrationTest
  test "should get companies:string" do
    get searches_companies:string_url
    assert_response :success
  end

  test "should get description:string" do
    get searches_description:string_url
    assert_response :success
  end

  test "should get name:string" do
    get searches_name:string_url
    assert_response :success
  end

  test "should get url:string" do
    get searches_url:string_url
    assert_response :success
  end

end
