class Staff::StaffController < ApplicationController
  include Pundit
  before_action :authenticate_staff!
  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index
end
