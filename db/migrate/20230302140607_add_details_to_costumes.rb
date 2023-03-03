class AddDetailsToCostumes < ActiveRecord::Migration[7.0]
  def change
    add_reference :costumes, :user, index: true
    add_column :costumes, :price, :integer
    add_column :costumes, :title, :string
    add_column :costumes, :description, :text
  end
end
