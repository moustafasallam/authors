class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :name
      t.text :description

      t.timestamps
    end

    create_join_table :authors, :books do |t|
    	t.index :author_id
    	t.index :book_id
  	end
  end
end
