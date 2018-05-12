Rails.application.routes.draw do
    ## frontend
    authenticated :user do
        get '/', to: 'frontend/cv_templates#index'
    end

    scope module: 'frontend' do
        resources :images
        resources :cv_templates do
            post 'sort', on: :member
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
