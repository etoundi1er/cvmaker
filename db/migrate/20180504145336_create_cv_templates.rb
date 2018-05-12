class CreateCvTemplates < ActiveRecord::Migration[5.1]
    def change
        create_table :images do |t|
            t.string :title
            t.string :image
            t.references :user, index: true
            t.timestamps
        end

        create_table :social_networks do |t|
            t.string :title
            t.string :url
            t.string :username
            t.references :cv_template, index: true
            t.references :user, index: true
            t.timestamps
        end

        create_table :experiences do |t|
            t.string :position
            t.string :company
            t.string :location
            t.string :start_date
            t.string :end_date
            t.text   :summary
            t.references :cv_template, index: true
            t.references :user, index: true
            t.timestamps
        end

        create_table :educations do |t|
            t.string :courses
            t.string :academy
            t.string :location
            t.string :start_date
            t.string :end_date
            t.text   :summary
            t.references :cv_template, index: true
            t.references :user, index: true
            t.timestamps
        end

        create_table :certifications do |t|
            t.string :title
            t.string :company
            t.string :location
            t.string :certification_date
            t.text   :summary
            t.references :cv_template, index: true
            t.references :user, index: true
            t.timestamps
        end

        create_table :recommendations do |t|
            t.string :name
            t.string :profession
            t.string :company
            t.string :phone
            t.string :email
            t.references :cv_template, index: true
            t.references :user, index: true
            t.timestamps
        end

        create_table :languages do |t|
            t.string :name
            t.string :level
            t.references :cv_template, index: true
            t.references :user, index: true
            t.timestamps
        end

        create_table :skills do |t|
            t.string :name
            t.string :level
            t.references :cv_template, index: true
            t.references :user, index: true
            t.timestamps
        end

        create_table :cv_templates do |t|
            t.string :title, index: true
            t.string :description

            t.string :firstname
            t.string :lastname
            t.string :profession

            t.string :phone
            t.string :email
            t.string :website
            t.text :address

            t.references :image, index: true
            t.references :user, index: true
            t.timestamps
        end
    end
end
