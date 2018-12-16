require 'test_helper'

class ChildrenControllerTest < ActionController::TestCase
  setup do
    @child = children(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:children)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create child" do
    assert_difference('Child.count') do
      post :create, child: { code: @child.code, dob: @child.dob, family_id: @child.family_id, family_name1: @child.family_name1, family_name2: @child.family_name2, gender: @child.gender, given_name1: @child.given_name1, given_name2: @child.given_name2, notes: @child.notes, preferred_name: @child.preferred_name, status: @child.status }
    end

    assert_redirected_to child_path(assigns(:child))
  end

  test "should show child" do
    get :show, id: @child
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @child
    assert_response :success
  end

  test "should update child" do
    patch :update, id: @child, child: { code: @child.code, dob: @child.dob, family_id: @child.family_id, family_name1: @child.family_name1, family_name2: @child.family_name2, gender: @child.gender, given_name1: @child.given_name1, given_name2: @child.given_name2, notes: @child.notes, preferred_name: @child.preferred_name, status: @child.status }
    assert_redirected_to child_path(assigns(:child))
  end

  test "should destroy child" do
    assert_difference('Child.count', -1) do
      delete :destroy, id: @child
    end

    assert_redirected_to children_path
  end
end
