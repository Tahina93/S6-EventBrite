class ChargesController < ApplicationController

  def new
  end

  def create
    # Amount in cents
    @amount = params[:amount]

    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })

    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'eur',
    })
    puts "******HAHAH******* #{params[:amount]}*************"
    
    redirect_to new_attendance_path

    rescue Stripe::CardError => e
      flash[:error] = e.message
      #redirect_to new_charge_path


    
  end
  
  #redirect_back fallback_location: "http://www.google.com"
  #self.redirect_to Rails.application.routes.url_helpers.new_attendance_path
end
