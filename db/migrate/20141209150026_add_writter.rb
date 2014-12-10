class AddWritter < ActiveRecord::Migration
  def change
      add_column :articles, :writter, :boolean
  end
end
