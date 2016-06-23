class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, presence: true
      t.string :password_hash,presence: true
      t.string :email, presense: true

      t.timestamps
  end
end
