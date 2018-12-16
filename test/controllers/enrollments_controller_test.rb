require 'test_helper'

class EnrollmentsControllerTest < ActionController::TestCase
  setup do
    @enrollment = enrollments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:enrollments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create enrollment" do
    assert_difference('Enrollment.count') do
      post :create, enrollment: { child_code: @enrollment.child_code, child_id: @enrollment.child_id, grades: @enrollment.grades, grades_notes: @enrollment.grades_notes, letter: @enrollment.letter, midyear_attendance_id: @enrollment.midyear_attendance_id, midyear_attendance_notes: @enrollment.midyear_attendance_notes, midyear_pant_size: @enrollment.midyear_pant_size, midyear_shirt_size: @enrollment.midyear_shirt_size, midyear_shoe_size: @enrollment.midyear_shoe_size, newyear_attendance_id: @enrollment.newyear_attendance_id, newyear_attendance_notes: @enrollment.newyear_attendance_notes, newyear_pant_size: @enrollment.newyear_pant_size, newyear_shirt_size: @enrollment.newyear_shirt_size, newyear_shoe_size: @enrollment.newyear_shoe_size, not_included: @enrollment.not_included, pass: @enrollment.pass, pass_notes: @enrollment.pass_notes, report_card: @enrollment.report_card, report_notes: @enrollment.report_notes, school_year: @enrollment.school_year, sponsor_code: @enrollment.sponsor_code, sponsor_id: @enrollment.sponsor_id, work_form: @enrollment.work_form, work_form_notes: @enrollment.work_form_notes }
    end

    assert_redirected_to enrollment_path(assigns(:enrollment))
  end

  test "should show enrollment" do
    get :show, id: @enrollment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @enrollment
    assert_response :success
  end

  test "should update enrollment" do
    patch :update, id: @enrollment, enrollment: { child_code: @enrollment.child_code, child_id: @enrollment.child_id, grades: @enrollment.grades, grades_notes: @enrollment.grades_notes, letter: @enrollment.letter, midyear_attendance_id: @enrollment.midyear_attendance_id, midyear_attendance_notes: @enrollment.midyear_attendance_notes, midyear_pant_size: @enrollment.midyear_pant_size, midyear_shirt_size: @enrollment.midyear_shirt_size, midyear_shoe_size: @enrollment.midyear_shoe_size, newyear_attendance_id: @enrollment.newyear_attendance_id, newyear_attendance_notes: @enrollment.newyear_attendance_notes, newyear_pant_size: @enrollment.newyear_pant_size, newyear_shirt_size: @enrollment.newyear_shirt_size, newyear_shoe_size: @enrollment.newyear_shoe_size, not_included: @enrollment.not_included, pass: @enrollment.pass, pass_notes: @enrollment.pass_notes, report_card: @enrollment.report_card, report_notes: @enrollment.report_notes, school_year: @enrollment.school_year, sponsor_code: @enrollment.sponsor_code, sponsor_id: @enrollment.sponsor_id, work_form: @enrollment.work_form, work_form_notes: @enrollment.work_form_notes }
    assert_redirected_to enrollment_path(assigns(:enrollment))
  end

  test "should destroy enrollment" do
    assert_difference('Enrollment.count', -1) do
      delete :destroy, id: @enrollment
    end

    assert_redirected_to enrollments_path
  end
end
