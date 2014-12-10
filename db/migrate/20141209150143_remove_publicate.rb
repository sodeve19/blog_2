class RemovePublicate < ActiveRecord::Migration
  def change
    remove_column :articles, :publicate
  end
end
