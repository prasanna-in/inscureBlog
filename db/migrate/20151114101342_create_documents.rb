class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
        t.string :purpose,         :null => false
        t.binary :file,         :null => false
        t.string :file_name
        t.string :mime_type
        t.integer :uploadable_id, precision: 50, scale: 0
        t.string :uploadable_type
        t.timestamps
    end
  end
end
