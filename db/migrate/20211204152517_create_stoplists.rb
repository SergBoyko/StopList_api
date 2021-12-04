class CreateStoplists < ActiveRecord::Migration[6.1]
  def change
    create_table :stoplists do |t|
      t.string :phone

      t.timestamps
    end
  end
end
