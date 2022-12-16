class AddReftoLikes < ActiveRecord::Migration[7.0]
  def change
    t.references :post, null: false, foreign_key: true
  end
end
