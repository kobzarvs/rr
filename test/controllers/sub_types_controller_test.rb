require 'test_helper'

class SubTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sub_type = sub_types(:one)
  end

  test "should get index" do
    get sub_types_url
    assert_response :success
  end

  test "should get new" do
    get new_sub_type_url
    assert_response :success
  end

  test "should create sub_type" do
    assert_difference('SubType.count') do
      post sub_types_url, params: { sub_type: { name: @sub_type.name } }
    end

    assert_redirected_to sub_type_path(SubType.last)
  end

  test "should show sub_type" do
    get sub_type_url(@sub_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_sub_type_url(@sub_type)
    assert_response :success
  end

  test "should update sub_type" do
    patch sub_type_url(@sub_type), params: { sub_type: { name: @sub_type.name } }
    assert_redirected_to sub_type_path(@sub_type)
  end

  test "should destroy sub_type" do
    assert_difference('SubType.count', -1) do
      delete sub_type_url(@sub_type)
    end

    assert_redirected_to sub_types_path
  end
end
