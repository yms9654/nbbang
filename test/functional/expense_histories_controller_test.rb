require 'test_helper'

class ExpenseHistoriesControllerTest < ActionController::TestCase
  setup do
    @expense_history = expense_histories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:expense_histories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create expense_history" do
    assert_difference('ExpenseHistory.count') do
      post :create, expense_history: { memo: @expense_history.memo, money: @expense_history.money }
    end

    assert_redirected_to expense_history_path(assigns(:expense_history))
  end

  test "should show expense_history" do
    get :show, id: @expense_history
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @expense_history
    assert_response :success
  end

  test "should update expense_history" do
    put :update, id: @expense_history, expense_history: { memo: @expense_history.memo, money: @expense_history.money }
    assert_redirected_to expense_history_path(assigns(:expense_history))
  end

  test "should destroy expense_history" do
    assert_difference('ExpenseHistory.count', -1) do
      delete :destroy, id: @expense_history
    end

    assert_redirected_to expense_histories_path
  end
end
