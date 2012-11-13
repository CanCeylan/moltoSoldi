class TypeNameChange < ActiveRecord::Migration
  def up
    rename_column :transactions, :type, :t_type
  end

  def down
  end
end
