# frozen_string_literal: true

require 'test_helper'
require 'application_system_test_case'

class RoundaboutTest < ApplicationSystemTestCase
  setup do
    Roundabout.instance_variable_set :@recorder, Roundabout::Recorder.new
    @user = User.first
  end

  # {from: from, to: to, method: method, type: type}
  private def assert_transition_recorded(transitions)
    assert_equal Set.new(transitions), Roundabout.recorder.transitions
  end

  test "visiting the index" do
    visit users_url
    assert_selector "h1", text: "Users"
  end

  test "creating a User" do
    visit users_url
    click_on "New User"

    fill_in "Name", with: @user.name
    click_on "Create User"

    assert_text "User was successfully created"
    click_on "Back"

    assert_transition_recorded [
      {from: 'users#index', to: 'users#new', method: :get, type: :link},
      {from: 'users#create', to: 'users#show', method: :get, type: :redirect},
      {from: 'users#new', to: 'users#create', method: :post, type: :form},
      {from: 'users#show', to: 'users#index', method: :get, type: :link}
    ]
  end

  test "updating a User" do
    visit users_url
    click_on "Edit", match: :first

    fill_in "Name", with: @user.name
    click_on "Update User"

    assert_text "User was successfully updated"
    click_on "Back"

    assert_transition_recorded [
      {from: 'users#index', to: 'users#edit', method: :get, type: :link},
      {from: 'users#update', to: 'users#show', method: :get, type: :redirect},
      {from: 'users#edit', to: 'users#update', method: :patch, type: :form},
      {from: 'users#show', to: 'users#index', method: :get, type: :link}
    ]
  end

  test "destroying a User" do
    visit users_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User was successfully destroyed"

    assert_transition_recorded [
      {from: 'users#index', to: 'users#destroy', method: :delete, type: :form},
      {from: 'users#destroy', to: "users#index", method: :get, type: :redirect}
    ]
  end
end
