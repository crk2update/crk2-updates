require 'test_helper'

class SponsorsControllerTest < ActionController::TestCase
  setup do
    @sponsor = sponsors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sponsors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sponsor" do
    assert_difference('Sponsor.count') do
      post :create, sponsor: { city: @sponsor.city, code: @sponsor.code, donor_number: @sponsor.donor_number, family_name: @sponsor.family_name, given_name: @sponsor.given_name, link: @sponsor.link, postal_code: @sponsor.postal_code, primary_email: @sponsor.primary_email, primary_phone: @sponsor.primary_phone, secondary_email: @sponsor.secondary_email, secondary_phone: @sponsor.secondary_phone, street_address: @sponsor.street_address }
    end

    assert_redirected_to sponsor_path(assigns(:sponsor))
  end

  test "should show sponsor" do
    get :show, id: @sponsor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sponsor
    assert_response :success
  end

  test "should update sponsor" do
    patch :update, id: @sponsor, sponsor: { city: @sponsor.city, code: @sponsor.code, donor_number: @sponsor.donor_number, family_name: @sponsor.family_name, given_name: @sponsor.given_name, link: @sponsor.link, postal_code: @sponsor.postal_code, primary_email: @sponsor.primary_email, primary_phone: @sponsor.primary_phone, secondary_email: @sponsor.secondary_email, secondary_phone: @sponsor.secondary_phone, street_address: @sponsor.street_address }
    assert_redirected_to sponsor_path(assigns(:sponsor))
  end

  test "should destroy sponsor" do
    assert_difference('Sponsor.count', -1) do
      delete :destroy, id: @sponsor
    end

    assert_redirected_to sponsors_path
  end
end
