class AddTemplateToCvTemplates < ActiveRecord::Migration[5.1]
    def change
        add_column :cv_templates, :template, :string, default: 'template_default'
    end
end
