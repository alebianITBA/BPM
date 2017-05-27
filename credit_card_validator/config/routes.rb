Rails.application.routes.draw do
  resource :credit_cards, only: [] do
    get :valid
  end
  resource :isbn, only: [] do
    get :valid
  end
end
