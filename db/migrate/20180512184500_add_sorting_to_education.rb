class AddSortingToEducation < ActiveRecord::Migration[5.1]
    def change
        add_column :educations, :sorting, :integer
        add_column :experiences, :sorting, :integer
        add_column :certifications, :sorting, :integer
        add_column :skills, :sorting, :integer
        add_column :languages, :sorting, :integer
        add_column :recommendations, :sorting, :integer
        add_column :social_networks, :sorting, :integer
    end
end
