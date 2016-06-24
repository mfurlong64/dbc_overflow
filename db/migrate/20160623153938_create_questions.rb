class CreateQuestions < ActiveRecord::Migration
  def change

    create_table :questions do |t|
      t.string :title, presence: true
      t.string :body, presence: true
      t.integer :user_id, presence: true

      t.timestamps null: false

    end
  end
end
