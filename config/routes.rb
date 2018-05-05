Rails.application.routes.draw do
    ## frontend
    authenticated :user do
        get '/', to: 'frontend/cv_templates#index'
    end

    scope module: 'frontend' do
        resources :images
        resources :cv_templates do
            resources :certifications
            resources :educations
            resources :experiences
            resources :languages
            resources :recommendations
            resources :social_networks
        end
    end

    devise_for :users

    root 'pages#index'
end
