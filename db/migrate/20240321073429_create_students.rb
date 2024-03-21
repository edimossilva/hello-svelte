# frozen_string_literal: true

class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :username, null: false

      t.references :teacher, index: true, foreign_key: true

      t.timestamps
    end
  end
end
