class CreateCertificates < ActiveRecord::Migration[7.0]
  def change
    create_table :certificates do |t|
      t.references :event, null: false, foreign_key: true
      t.string :name
      t.string :email
      t.text :description

      t.timestamps
    end
  end
end
