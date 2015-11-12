class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :body
      t.text :links
      t.text :attachments
      t.string :comments
      t.string :username

      t.timestamps null: false
    end
  end
end
