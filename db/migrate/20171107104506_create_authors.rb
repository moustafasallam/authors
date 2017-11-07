class CreateAuthors < ActiveRecord::Migration[5.1]
  def change
    create_table :authors do |t|
      t.string :first_name
      t.string :family_name
      t.string :phone_number
      t.datetime :date_of_birth

      t.timestamps
    end
  end
end
