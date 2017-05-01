class Staff::StaffController < ApplicationController
  before_action :authenticate_staff!

  # These ensure that Pundit is being called for every action
  # TODO: remove from production code.
  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index
end
