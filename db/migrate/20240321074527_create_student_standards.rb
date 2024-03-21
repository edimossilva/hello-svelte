# frozen_string_literal: true

class CreateStudentStandards < ActiveRecord::Migration[7.0]
  def change
    create_table :student_standards do |t|
      t.integer :subject_area, null: false
      t.datetime :began_on
      t.datetime :ended_on
      t.float :quiz_growth
      t.float :final_quiz_score

      t.references :student, index: true, foreign_key: true

      t.timestamps
    end
  end
end
