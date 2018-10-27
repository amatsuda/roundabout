# frozen_string_literal: true

require 'active_record'
require 'action_controller/railtie'

# config
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: ':memory:')

class RoundaboutTestApp < Rails::Application
  config.secret_key_base = config.secret_token = "I'll be the roundabout. The words will make you out 'n' out."
  config.session_store :cookie_store, key: '_myapp_session'
  config.active_support.deprecation = :log
  config.eager_load = false
  config.root = __dir__
end
Rails.application.initialize!

# routes
Rails.application.routes.draw do
  resources :users
end

# models
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
class User < ApplicationRecord
end

# controllers
class ApplicationController < ActionController::Base; end
class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name)
  end
end

# helpers
module ApplicationHelper; end

#migrations
class CreateAllTables < ActiveRecord::VERSION::MAJOR >= 5 ? ActiveRecord::Migration[5.0] : ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
    end
  end
end
