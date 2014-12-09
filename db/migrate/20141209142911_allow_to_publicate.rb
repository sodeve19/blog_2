class AllowToPublicate < ActiveRecord::Migration
  def change
      add_column :articles, :publicate, :boolean
  end
end
