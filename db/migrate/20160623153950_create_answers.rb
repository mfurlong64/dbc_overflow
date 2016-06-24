class CreateAnswers < ActiveRecord::Migration
  def change

    create_table :answers do |t|
      t.string :body, presence: true
      t.integer :question_id, presence: true
      t.integer :user_id, presence: true

      t.timestamps null: false

    end
  end
end
