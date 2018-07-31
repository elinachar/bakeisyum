class SubscriptionsController < ApplicationController
  # POST /subscriptions
  # POST /subscriptions.json
  def create
    @subscription = Subscription.new(subscription_params)

    respond_to do |format|
      if @subscription.save
        format.html { redirect_to basic_pages_index_path, notice: 'You have successfully subscribed to Bake is Yum!' }
        format.json { render :show, status: :created, location: @subscription }
        format.js
        UserMailer.subscription_successful(@subscription, Recipe.last(3)).deliver_now
      else
        format.html { redirect_to basic_pages_index_path, alert: 'You could not subscribe to Bake is Yum. ' + @subscription.errors.full_messages[0]}
        format.json { render json: @subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subscriptions/1
  # DELETE /subscriptions/1.json
  # def destroy
  def show
    @subscription = Subscription.find(params[:id])
    @subscription.destroy
    respond_to do |format|
      format.html { redirect_to basic_pages_index_path, notice: 'You have successfully unsubscribed from our list.' }
      format.json { head :no_content }
    end
  end



  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def subscription_params
      params.require(:subscription).permit(:email)
    end

end
