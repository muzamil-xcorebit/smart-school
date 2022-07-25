class AddEducationToTeacher < ActiveRecord::Migration[6.0]
  def change
    add_column :teachers, :education, :string
  end
end
