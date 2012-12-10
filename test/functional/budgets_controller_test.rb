require 'test_helper'

class BudgetsControllerTest < ActionController::TestCase
  setup do
    @budget = budgets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:budgets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create budget" do
    assert_difference('Budget.count') do
      post :create, budget: { customer: @budget.customer, date: @budget.date, delivery: @budget.delivery, file_number: @budget.file_number, general_markup: @budget.general_markup, locality: @budget.locality, offer: @budget.offer, opening: @budget.opening, place_of_delivery: @budget.place_of_delivery, private_number: @budget.private_number, street: @budget.street, with_payment: @budget.with_payment }
    end

    assert_redirected_to budget_path(assigns(:budget))
  end

  test "should show budget" do
    get :show, id: @budget
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @budget
    assert_response :success
  end

  test "should update budget" do
    put :update, id: @budget, budget: { customer: @budget.customer, date: @budget.date, delivery: @budget.delivery, file_number: @budget.file_number, general_markup: @budget.general_markup, locality: @budget.locality, offer: @budget.offer, opening: @budget.opening, place_of_delivery: @budget.place_of_delivery, private_number: @budget.private_number, street: @budget.street, with_payment: @budget.with_payment }
    assert_redirected_to budget_path(assigns(:budget))
  end

  test "should destroy budget" do
    assert_difference('Budget.count', -1) do
      delete :destroy, id: @budget
    end

    assert_redirected_to budgets_path
  end
end
