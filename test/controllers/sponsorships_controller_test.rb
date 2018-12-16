require 'test_helper'

class SponsorshipsControllerTest < ActionController::TestCase
  setup do
    @sponsorship = sponsorships(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sponsorships)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sponsorship" do
    assert_difference('Sponsorship.count') do
      post :create, sponsorship: { dollar_amount: @sponsorship.dollar_amount, number_children: @sponsorship.number_children, school_year: @sponsorship.school_year, sponsor_code: @sponsorship.sponsor_code, sponsor_id: @sponsorship.sponsor_id }
    end

    assert_redirected_to sponsorship_path(assigns(:sponsorship))
  end

  test "should show sponsorship" do
    get :show, id: @sponsorship
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sponsorship
    assert_response :success
  end

  test "should update sponsorship" do
    patch :update, id: @sponsorship, sponsorship: { dollar_amount: @sponsorship.dollar_amount, number_children: @sponsorship.number_children, school_year: @sponsorship.school_year, sponsor_code: @sponsorship.sponsor_code, sponsor_id: @sponsorship.sponsor_id }
    assert_redirected_to sponsorship_path(assigns(:sponsorship))
  end

  test "should destroy sponsorship" do
    assert_difference('Sponsorship.count', -1) do
      delete :destroy, id: @sponsorship
    end

    assert_redirected_to sponsorships_path
  end
end
