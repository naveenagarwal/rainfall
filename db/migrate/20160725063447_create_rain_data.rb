class CreateRainData < ActiveRecord::Migration[5.0]
  def change
    create_table :rain_data do |t|
      t.string :name
      t.integer :year
      t.float :jan
      t.float :feb
      t.float :mar
      t.float :apr
      t.float :may
      t.float :jun
      t.float :jul
      t.float :aug
      t.float :sep
      t.float :oct
      t.float :nov
      t.float :dec
      t.float :annual
      t.float :jan_feb
      t.float :mar_may
      t.float :jun_sep
      t.float :oct_dec

      t.timestamps
    end

    add_index :rain_data, :name
    add_index :rain_data, :year
  end
end
