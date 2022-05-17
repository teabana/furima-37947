class RemoveLastnameFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :last_naem, :string
  end
end
