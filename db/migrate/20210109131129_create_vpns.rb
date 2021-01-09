class CreateVpns < ActiveRecord::Migration[6.0]
  def change
    create_table :vpns do |t|
      t.string :name
      t.string :ipaddress
      t.string :ipaddress_bk
      t.string :status

      t.timestamps
    end
  end
end
