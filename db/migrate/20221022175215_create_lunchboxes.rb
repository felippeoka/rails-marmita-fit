class CreateLunchboxes < ActiveRecord::Migration[7.0]
  def change
    create_table :lunchboxes do |t|
      t.string :food
      t.string :size
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
