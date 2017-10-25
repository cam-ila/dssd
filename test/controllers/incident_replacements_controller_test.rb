require 'test_helper'

class IncidentReplacementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @incident_replacement = incident_replacements(:one)
  end

  test "should get index" do
    get incident_replacements_url
    assert_response :success
  end

  test "should get new" do
    get new_incident_replacement_url
    assert_response :success
  end

  test "should create incident_replacement" do
    assert_difference('IncidentReplacement.count') do
      post incident_replacements_url, params: { incident_replacement: { amount: @incident_replacement.amount, description: @incident_replacement.description } }
    end

    assert_redirected_to incident_replacement_url(IncidentReplacement.last)
  end

  test "should show incident_replacement" do
    get incident_replacement_url(@incident_replacement)
    assert_response :success
  end

  test "should get edit" do
    get edit_incident_replacement_url(@incident_replacement)
    assert_response :success
  end

  test "should update incident_replacement" do
    patch incident_replacement_url(@incident_replacement), params: { incident_replacement: { amount: @incident_replacement.amount, description: @incident_replacement.description } }
    assert_redirected_to incident_replacement_url(@incident_replacement)
  end

  test "should destroy incident_replacement" do
    assert_difference('IncidentReplacement.count', -1) do
      delete incident_replacement_url(@incident_replacement)
    end

    assert_redirected_to incident_replacements_url
  end
end
