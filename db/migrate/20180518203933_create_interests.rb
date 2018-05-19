class CreateInterests < ActiveRecord::Migration[5.1]
    def change
        create_table :interests do |t|
            t.string :name
            t.integer :sorting
            t.references :cv_template, foreign_key: true
            t.references :user, foreign_key: true
            t.timestamps
        end
    end
end
