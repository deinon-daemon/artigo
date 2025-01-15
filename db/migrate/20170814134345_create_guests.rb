class CreateGuests < ActiveRecord::Migration[5.0]
  def change
    create_table :guests do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :guest_id
      t.datetime :created_at
      t.timestamps
    end
  end
end
