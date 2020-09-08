class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user,      foreign_key: true
      t.string :name,          null: false
      t.text :detail,          null: false
      t.integer :category_id,  null: false
      t.integer :age_year_id
      t.integer :age_month_id
      t.integer :size
      t.integer :price

      t.timestamps
    end
  end
end
