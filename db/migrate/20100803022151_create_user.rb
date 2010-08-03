class CreateUser < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :phone_number, :registration_identifier
      t.timestamps
    end
    add_index :users, :phone_number
    add_index :users, :registration_identifier
  end

  def self.down
    drop_table :users
  end
end
