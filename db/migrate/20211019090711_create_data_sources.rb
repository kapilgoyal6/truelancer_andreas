class CreateDataSources < ActiveRecord::Migration[6.1]
  def change
    create_table :data_sources do |t|
      t.string :name
      t.text :description
      t.text :type

      t.timestamps
    end
  end
end
