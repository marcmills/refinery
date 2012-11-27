Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :care_homes do
    resources :care_homes, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :care_homes, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :care_homes, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
