class FixColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :properties, :type, :type_of_property
  end
end
