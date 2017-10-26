require 'test_helper'

class StiffenersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stiffener = stiffeners(:one)
  end

  test "should get index" do
    get stiffeners_url
    assert_response :success
  end

  test "should get new" do
    get new_stiffener_url
    assert_response :success
  end

  test "should create stiffener" do
    assert_difference('Stiffener.count') do
      post stiffeners_url, params: { stiffener: { Chamfer: @stiffener.Chamfer, Height: @stiffener.Height, Pos: @stiffener.Pos, Width: @stiffener.Width } }
    end

    assert_redirected_to stiffener_url(Stiffener.last)
  end

  test "should show stiffener" do
    get stiffener_url(@stiffener)
    assert_response :success
  end

  test "should get edit" do
    get edit_stiffener_url(@stiffener)
    assert_response :success
  end

  test "should update stiffener" do
    patch stiffener_url(@stiffener), params: { stiffener: { Chamfer: @stiffener.Chamfer, Height: @stiffener.Height, Pos: @stiffener.Pos, Width: @stiffener.Width } }
    assert_redirected_to stiffener_url(@stiffener)
  end

  test "should destroy stiffener" do
    assert_difference('Stiffener.count', -1) do
      delete stiffener_url(@stiffener)
    end

    assert_redirected_to stiffeners_url
  end
end
