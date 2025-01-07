class CreateEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :events do |t|
      t.references :hoster, null: false, foreign_key: { to_table: :users }
      t.string :name, null: false
      t.string :description, null: false
      t.string :location, null: false
      t.timestamps
    end
  end
end
