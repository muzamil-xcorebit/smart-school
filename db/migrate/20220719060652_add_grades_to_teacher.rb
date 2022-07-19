class AddGradesToTeacher < ActiveRecord::Migration[6.0]
  def change
    add_column :teachers, :grades, :string, array: true, default: []
  end
end
