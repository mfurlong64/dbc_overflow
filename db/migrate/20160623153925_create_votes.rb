class CreateVotes < ActiveRecord::Migration
  def change

    create_table :votes do |t|
      t.integer :user_id
      t.integer :value, presence: true
      t.integer :voteable_id
      t.string :voteable_type

      t.timestamps null: false

    end

    add_index :votes, :voteable_id

  end
end
