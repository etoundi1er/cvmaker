class AddSummaryToCvTemplates < ActiveRecord::Migration[5.1]
    def change
        add_column :cv_templates, :summary, :text
    end
end
