class AddRecipePermalink < ActiveRecord::Migration
  def self.up
    add_column :recipes, :permalink, :string
  end

  def self.down
    remove_column :recipes, :permalink
  end
end

