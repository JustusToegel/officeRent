class RemoveAdressFromFlats < ActiveRecord::Migration[7.1]
  def change
    remove_column :flats, :adress, :string
  end
end
