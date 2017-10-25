require 'test_helper'

class IncicentReplacementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @incicent_replacement = incicent_replacements(:one)
  end

  test "should get index" do
    get incicent_replacements_url
    assert_response :success
  end

  test "should get new" do
    get new_incicent_replacement_url
    assert_response :success
  end

  test "should create incicent_replacement" do
    assert_difference('IncicentReplacement.count') do
      post incicent_replacements_url, params: { incicent_replacement: { amount: @incicent_replacement.amount, description: @incicent_replacement.description } }
    end

    assert_redirected_to incicent_replacement_url(IncicentReplacement.last)
  end

  test "should show incicent_replacement" do
    get incicent_replacement_url(@incicent_replacement)
    assert_response :success
  end

  test "should get edit" do
    get edit_incicent_replacement_url(@incicent_replacement)
    assert_response :success
  end

  test "should update incicent_replacement" do
    patch incicent_replacement_url(@incicent_replacement), params: { incicent_replacement: { amount: @incicent_replacement.amount, description: @incicent_replacement.description } }
    assert_redirected_to incicent_replacement_url(@incicent_replacement)
  end

  test "should destroy incicent_replacement" do
    assert_difference('IncicentReplacement.count', -1) do
      delete incicent_replacement_url(@incicent_replacement)
    end

    assert_redirected_to incicent_replacements_url
  end
end
