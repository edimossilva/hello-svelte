# frozen_string_literal: true

class CreateStudentsActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :student_activities do |t|
      t.datetime :began_on
      t.datetime :ended_on
      t.boolean :rated_positively, null: false, default: false

      t.references :student_standard, index: true, foreign_key: true

      t.timestamps
    end
  end
end
