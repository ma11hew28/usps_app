class WelcomeController < ApplicationController
  def index
    @address = USPS::Address.new(
      :address2 => '6406 Ivy Lane',
      :city => 'Greenbelt',
      :state => 'MD'
    ).standardize
  end
end
