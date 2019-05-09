class ChargesController < ApplicationController

  def new
  	@event = Event.find(params[:id])
  end

  def create

  	event = Event.find(params[:id])
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
    
    @attendance = Attendance.create(stripe_customer_id: customer.id, created_event: event, participant: current_user)

    redirect_to event_path(event.id)

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path


    
  end
  
  #redirect_back fallback_location: "http://www.google.com"
  #self.redirect_to Rails.application.routes.url_helpers.new_attendance_path
end
