Spree::Core::Engine.routes.draw do
  # Add your extension routes here

  Spree::Core::Engine.routes.draw do
    namespace :admin do
      resources :products do
        resources :variants do
          resources :barcodes do
            collection do
              post :update_positions
            end
          end
        end
      end
    end
  end
  
end
