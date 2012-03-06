class AddAuthorToProducts < ActiveRecord::Migration
  def change
    add_column :products, :author, :string

  end
end
