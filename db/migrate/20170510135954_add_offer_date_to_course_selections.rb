class AddOfferDateToCourseSelections < ActiveRecord::Migration[5.0]
  def up
    add_column :course_selections, :offer_date, :datetime

    CourseSelection.includes(:application).all.each do |selection|
      if selection.college_offer.present?
        selection.offer_date = (selection.application.submitted_date + rand(7..21).days)
        selection.save!
      end
    end
  end

  def down
    remove_column :course_selections, :offer_date
  end
end
