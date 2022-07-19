class AddGradesToChild < ActiveRecord::Migration[6.0]
  def change
    add_column :children, :grades, :string
  end
end
