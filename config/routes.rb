Rails.application.routes.draw do
    scope '(:locale)', locale: /en|fr/ do
        ## frontend
        authenticated :user do
            get '/', to: 'frontend/cv_templates#index'
        end

        scope module: 'frontend' do
            get 'previews/:cv_template_id', to: 'previews#show', as: 'cv_template_preview'
            get 'previews/:cv_template_id/download', to: 'previews#download', as: 'cv_template_download'

            get 'admin', to: 'admins#index'
            delete 'admin/user/:id', to: 'admins#destroy_user', as: 'admin_destroy_user'
            post 'admin/login_as_user/:id', to: 'admins#login_as_user', as: 'admin_login_as_user'
            post 'admin/recreate_dummy_cv', to: 'admins#recreate_dummy_cv'

            resources :images
            resources :cv_templates, except: :show do
                member do
                    post 'sort'
                end
                resources :social_networks, except: %i[index edit show]
                resources :educations, except: %i[index edit show]
                resources :experiences, except: %i[index edit show]
                resources :certifications, except: %i[index edit show]
                resources :skills, except: %i[index edit show]
                resources :languages, except: %i[index edit show]
                resources :recommendations, except: %i[index edit show]
                resources :interests, except: %i[index edit show]
            end
        end

        devise_for :users

        root 'pages#index'
    end
end
