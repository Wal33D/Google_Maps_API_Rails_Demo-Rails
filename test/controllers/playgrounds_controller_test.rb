require 'test_helper'

class PlaygroundsControllerTest < ActionController::TestCase
  setup do
    @playground = playgrounds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:playgrounds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create playground" do
    assert_difference('Playground.count') do
      post :create, playground: { city: @playground.city, country: @playground.country, latitude: @playground.latitude, longitude: @playground.longitude, name: @playground.name, postal_code: @playground.postal_code, route: @playground.route, sport: @playground.sport, street_number: @playground.street_number }
    end

    assert_redirected_to playground_path(assigns(:playground))
  end

  test "should show playground" do
    get :show, id: @playground
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @playground
    assert_response :success
  end

  test "should update playground" do
    patch :update, id: @playground, playground: { city: @playground.city, country: @playground.country, latitude: @playground.latitude, longitude: @playground.longitude, name: @playground.name, postal_code: @playground.postal_code, route: @playground.route, sport: @playground.sport, street_number: @playground.street_number }
    assert_redirected_to playground_path(assigns(:playground))
  end

  test "should destroy playground" do
    assert_difference('Playground.count', -1) do
      delete :destroy, id: @playground
    end

    assert_redirected_to playgrounds_path
  end
end
