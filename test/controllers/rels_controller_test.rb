require 'test_helper'

class RelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rel = rels(:one)
  end

  test "should get index" do
    get rels_url
    assert_response :success
  end

  test "should get new" do
    get new_rel_url
    assert_response :success
  end

  test "should create rel" do
    assert_difference('Rel.count') do
      post rels_url, params: { rel: { node1: @rel.node1, node2: @rel.node2, rel_type_id: @rel.rel_type_id } }
    end

    assert_redirected_to rel_path(Rel.last)
  end

  test "should show rel" do
    get rel_url(@rel)
    assert_response :success
  end

  test "should get edit" do
    get edit_rel_url(@rel)
    assert_response :success
  end

  test "should update rel" do
    patch rel_url(@rel), params: { rel: { node1: @rel.node1, node2: @rel.node2, rel_type_id: @rel.rel_type_id } }
    assert_redirected_to rel_path(@rel)
  end

  test "should destroy rel" do
    assert_difference('Rel.count', -1) do
      delete rel_url(@rel)
    end

    assert_redirected_to rels_path
  end
end
