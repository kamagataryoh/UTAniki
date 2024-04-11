class CreateRiders < ActiveRecord::Migration[6.1]
  def change
    add_column :tweets, :image, :string
    create_table :riders do |t|
      t.string :name
      t.string :title
      t.string :image
      t.string :about
      t.integer :user_id

      t.timestamps
    end
  end
end
