class CreditCardsController < ApplicationController
  def valid
    valid_provider = CreditCard::VALID_PROVIDERS.include? card_params[:provider]
    valid_number = CreditCard::VALID_CARDS.include? card_params[:number]
    render status: :ok, json: { valid: valid_provider && valid_number }
  end

  private

  def card_params
    params.permit(:provider, :number)
  end
end
