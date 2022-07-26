class AddExternalKeyColumnToBlogs < ActiveRecord::Migration[7.0]
  def change
    add_reference :blogs, :user, index: true, foreign_key: true
  end
end
