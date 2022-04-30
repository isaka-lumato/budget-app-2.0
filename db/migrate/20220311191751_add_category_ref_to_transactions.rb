class AddCategoryRefToTransactions < ActiveRecord::Migration[7.0]
  def change
    add_reference :transactions, :categories, foreign_key: { to_table: :categories }
  end
end
