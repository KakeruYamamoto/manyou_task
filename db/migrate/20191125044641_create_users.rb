# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :email
      t.string :password_digest
      t.boolean :admin, default: false

      t.timestamps
      t.index :email, unique: true
    end
  end
end
