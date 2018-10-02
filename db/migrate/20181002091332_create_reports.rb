class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.integer :status, default: 0, null: false
      t.boolean :is_deleted, default: false, null: false
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
