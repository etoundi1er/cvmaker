class AddUsernameToSocialNetworks < ActiveRecord::Migration[5.1]
    def change
        add_column :social_networks, :username, :string
    end
end
