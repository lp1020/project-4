class AddNotesToPlaces < ActiveRecord::Migration[5.1]
  def change
    add_column :places, :notes, :string, default: ""
  end
end
