class CreateHosts < ActiveRecord::Migration[5.0]
  def change
    create_table :hosts do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :host_id
      t.datetime :created_at
      t.timestamps
    end
  end
end
