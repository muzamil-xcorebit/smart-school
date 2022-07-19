class AddGradesToPod < ActiveRecord::Migration[6.0]
  def change
    add_column :pods, :grades, :string, array: true, default: []
  end
end
