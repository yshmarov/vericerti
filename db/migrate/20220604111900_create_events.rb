class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.references :user, null: false, foreign_key: true
      t.string :certificate_template
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
