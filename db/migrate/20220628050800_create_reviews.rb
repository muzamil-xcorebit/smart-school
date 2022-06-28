class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :review
      t.references :pod, null: false, foreign_key: true
      t.references :parent, null: false, foreign_key: true

      t.timestamps
    end
  end
end
