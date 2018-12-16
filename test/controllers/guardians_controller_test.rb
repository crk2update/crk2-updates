require 'test_helper'

class GuardiansControllerTest < ActionController::TestCase
  setup do
    @guardian = guardians(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:guardians)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create guardian" do
    assert_difference('Guardian.count') do
      post :create, guardian: { active: @guardian.active, family_id: @guardian.family_id, family_name1: @guardian.family_name1, family_name2: @guardian.family_name2, given_name1: @guardian.given_name1, given_name2: @guardian.given_name2, preferred_name: @guardian.preferred_name, primary: @guardian.primary, primary_phone: @guardian.primary_phone, relationship: @guardian.relationship, relationship_id: @guardian.relationship_id, secondary_phone: @guardian.secondary_phone }
    end

    assert_redirected_to guardian_path(assigns(:guardian))
  end

  test "should show guardian" do
    get :show, id: @guardian
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @guardian
    assert_response :success
  end

  test "should update guardian" do
    patch :update, id: @guardian, guardian: { active: @guardian.active, family_id: @guardian.family_id, family_name1: @guardian.family_name1, family_name2: @guardian.family_name2, given_name1: @guardian.given_name1, given_name2: @guardian.given_name2, preferred_name: @guardian.preferred_name, primary: @guardian.primary, primary_phone: @guardian.primary_phone, relationship: @guardian.relationship, relationship_id: @guardian.relationship_id, secondary_phone: @guardian.secondary_phone }
    assert_redirected_to guardian_path(assigns(:guardian))
  end

  test "should destroy guardian" do
    assert_difference('Guardian.count', -1) do
      delete :destroy, id: @guardian
    end

    assert_redirected_to guardians_path
  end
end
