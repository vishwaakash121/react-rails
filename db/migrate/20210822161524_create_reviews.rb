class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :title
      t.string :description
      t.integer :scope
      t.belongs_to :airline, foreign_key: true

      t.timestamps
    end
  end
end
