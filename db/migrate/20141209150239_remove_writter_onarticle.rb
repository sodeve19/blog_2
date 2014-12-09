class RemoveWritterOnarticle < ActiveRecord::Migration
  def change
    remove_column :articles, :writter
    add_column :users, :writter, :boolean
  end
end
