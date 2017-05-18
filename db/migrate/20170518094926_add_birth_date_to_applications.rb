class AddBirthDateToApplications < ActiveRecord::Migration[5.0]
  def up
    add_column :applications, :birth_date, :date

    range = (Date.new(1970, 1, 1)..Date.new(1999, 12, 31)).to_a
    Application.all.each do |app|
      app.birth_date = range.sample
      app.save validate: false
    end
  end

  def down
    remove_column :applications, :birth_date
  end
end
