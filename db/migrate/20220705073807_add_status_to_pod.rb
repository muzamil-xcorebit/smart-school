class AddStatusToPod < ActiveRecord::Migration[6.0]
  def change
    add_column :pods, :status, :integer, default: 1
  end
end
