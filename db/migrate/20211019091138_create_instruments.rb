class CreateInstruments < ActiveRecord::Migration[6.1]
  def change
    create_table :instruments do |t|
      t.string :ric
      t.string :name
      t.references :data_source, foreign_key: true
      t.string :third_party_instrument

      t.timestamps
    end
  end
end
