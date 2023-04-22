class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties do |t|
      t.text :property
      t.text :rent
      t.text :building_age
      t.text :address
      t.text :remark

      t.timestamps
    end
  end
end
