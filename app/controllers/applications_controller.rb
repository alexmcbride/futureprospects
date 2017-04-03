class ApplicationsController < ApplicationController
  def index

  end

  def profile
    @application = Application.new
  end

  def profile_next
    # submit data, move to next section.
  end

  def education
  end

  def employment
  end

  def references

  end

  def statement
  end

  def courses
  end

  def submit
  end
end
