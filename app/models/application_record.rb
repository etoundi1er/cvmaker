class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true

    after_create :set_sorting, if: :sorting_in_table?

    def self.default_scope
        order(sorting: :asc) if has_attribute? :sorting
    end

    def set_sorting
        update_column(:sorting, self.class.maximum(:sorting).to_i + 1)
    end

    private

    def sorting_in_table?
        has_attribute? :sorting
    end
end
