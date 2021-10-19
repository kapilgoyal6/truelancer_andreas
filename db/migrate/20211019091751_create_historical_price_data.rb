class CreateHistoricalPriceData < ActiveRecord::Migration[6.1]
  def change
    create_table :historical_price_data do |t|
      t.date :date
      t.float :high
      t.float :low
      t.float :open
      t.float :close
      t.bigint :volume
      t.json :additional_data
      t.string :type

      t.timestamps
    end
  end
end
