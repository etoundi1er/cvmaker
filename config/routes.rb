Rails.application.routes.draw do
    ## frontend
    authenticated :user do
        get '/', to: 'frontend/cv_templates#index'
    end

    scope module: 'frontend' do
        resources :images
        resources :cv_templates do
            resources :social_networks, except: %i[index edit show]

            member do
                patch 'update_step_social'
                patch 'update_step_education'
                patch 'update_step_experiences'
                patch 'update_step_certifications'
                patch 'update_step_skills'
                patch 'update_step_languages'
                patch 'update_step_recommendations'
            end
        end
    end

    devise_for :users

    root 'pages#index'
end
