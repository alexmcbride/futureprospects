class AddIndexesToReferences < ActiveRecord::Migration[5.0]
  def change
    add_index :references, :application_id
  end
end
