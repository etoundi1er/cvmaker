class AddDummyFlagToCvTemplates < ActiveRecord::Migration[5.1]
    def change
        add_column :cv_templates, :dummy, :boolean, default: false
    end
end
