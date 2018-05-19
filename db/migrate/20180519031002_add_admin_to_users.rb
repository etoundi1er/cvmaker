class AddAdminToUsers < ActiveRecord::Migration[5.1]
    def change
        add_column :users, :admin, :boolean, default: false

        reversible do |dir|
            dir.up do
                user = User.first
                user.update_column(:admin, true) if user
            end
        end
    end
end
