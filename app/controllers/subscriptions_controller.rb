class SubscriptionsController < ApplicationController
  # POST /subscriptions
  # POST /subscriptions.json
  def create
    @subscription = Subscription.new(subscription_params)
    @privacy_policy = params[:subscription][:privacy_policy].to_i

    respond_to do |format|
      if @privacy_policy == 1
        if @subscription.save
          format.html { redirect_to basic_pages_index_path, notice: 'You have successfully subscribed to Bake is Yum!' }
          format.json { render :show, status: :created, location: @subscription }
          format.js
          UserMailer.subscription_successful(@subscription, Recipe.last(3)).deliver_now
        else
          subscription_errors
          format.html { redirect_to basic_pages_index_path}
          format.json { render json: @subscription.errors, status: :unprocessable_entity }
          format.js
        end
      else
        if !@subscription.valid?
          subscription_errors
        end
        format.html { redirect_to basic_pages_index_path}
        format.json { render json: @subscription.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # GET /subscriptions/1
  # GET /subscriptions/1.json
  def unsubscribe
    @subscription = Subscription.find(params[:format])
    @subscription.destroy
    redirect_to basic_pages_index_path, notice: 'You have successfully unsubscribed from our list.'
  end


  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def subscription_params
      params.require(:subscription).permit(:email)
    end

    def subscription_errors
      if @subscription.errors.full_messages[0].include?  "blank"
        @subscription_error = "blank"
      elsif  @subscription.errors.full_messages[0].include?  "invalid"
        @subscription_error = "invalid"
      elsif @subscription.errors.full_messages[0].include?  "taken"
        @subscription_error = "taken"
      end
    end

end
