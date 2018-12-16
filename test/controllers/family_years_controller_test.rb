require 'test_helper'

class FamilyYearsControllerTest < ActionController::TestCase
  setup do
    @family_year = family_years(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:family_years)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create family_year" do
    assert_difference('FamilyYear.count') do
      post :create, family_year: { community_id: @family_year.community_id, family_id: @family_year.family_id, notes: @family_year.notes, picture: @family_year.picture, school_year: @family_year.school_year }
    end

    assert_redirected_to family_year_path(assigns(:family_year))
  end

  test "should show family_year" do
    get :show, id: @family_year
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @family_year
    assert_response :success
  end

  test "should update family_year" do
    patch :update, id: @family_year, family_year: { community_id: @family_year.community_id, family_id: @family_year.family_id, notes: @family_year.notes, picture: @family_year.picture, school_year: @family_year.school_year }
    assert_redirected_to family_year_path(assigns(:family_year))
  end

  test "should destroy family_year" do
    assert_difference('FamilyYear.count', -1) do
      delete :destroy, id: @family_year
    end

    assert_redirected_to family_years_path
  end
end
