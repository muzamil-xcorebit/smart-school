class CreatePods < ActiveRecord::Migration[6.0]
  def change
    create_table :pods do |t|
      t.string :name
      t.string :phone_number
      t.timestamps
    end
  end
end
