# frozen_string_literal: true

class AddActivityToStudentActivity < ActiveRecord::Migration[7.0]
  def change
    add_reference :student_activities, :activity, index: true
  end
end
