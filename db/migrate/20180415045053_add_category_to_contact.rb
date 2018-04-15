class AddCategoryToContact < ActiveRecord::Migration[5.1]
  def change
    add_column :contacts, :category, :integer
  end
end
