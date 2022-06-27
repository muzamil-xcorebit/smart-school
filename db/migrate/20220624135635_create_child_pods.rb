class CreateChildPods < ActiveRecord::Migration[6.0]
  def change
    create_table :child_pods do |t|
      t.string :status, default: 'pending'
      t.references :child, null: false, foreign_key: true
      t.references :pod, null: false, foreign_key: true

      t.timestamps
    end
  end
end
