class CreatePermissions < ActiveRecord::Migration[6.0]
  def change
    create_table :permissions do |t|
      t.string :action
      t.text :description

      t.timestamps
    end
  end
end
