class CreateDataSourceMetadata < ActiveRecord::Migration[6.1]
  def change
    create_table :data_source_metadata do |t|
      t.string :code
      t.references :data_source, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.datetime :refreshed_at
      t.date :from_date
      t.date :to_date

      t.timestamps
    end
  end
end
