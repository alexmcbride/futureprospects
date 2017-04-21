class AddIndexesToQualifications < ActiveRecord::Migration[5.0]
  def change
    add_index :qualifications, :school_id
  end
end
