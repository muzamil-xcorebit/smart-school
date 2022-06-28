class CreateTeachers < ActiveRecord::Migration[6.0]
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :phone_number
      t.references :pod, null: false, foreign_key: true

      t.timestamps
    end
  end
end
