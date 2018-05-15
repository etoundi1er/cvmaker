Rails.application.routes.draw do
    ## frontend
    authenticated :user do
        get '/', to: 'frontend/cv_templates#index'
    end

    scope module: 'frontend' do
        get 'previews/:cv_template_id', to: 'previews#show', as: 'cv_template_preview'
        get 'previews/:cv_template_id/download', to: 'previews#download', as: 'cv_template_download'

        resources :images
        resources :cv_templates do
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
        end
    end

    devise_for :users

    root 'pages#index'
end
