class DeleteColumnToBlogs < ActiveRecord::Migration[7.0]
  def change
    remove_column :blogs, :status, :integer
  end
end
