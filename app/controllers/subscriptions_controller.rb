class SubscriptionsController < ApplicationController
  # POST /subscriptions
  # POST /subscriptions.json
  def create
    @subscription = Subscription.new(subscription_params)
    @subscription.language = params[:locale]
    @privacy_policy = params[:subscription][:privacy_policy].to_i

    respond_to do |format|
      if @privacy_policy == 1
        if @subscription.save
          format.html { redirect_to basic_pages_index_path, notice:  t('subscriptions.successfull_subscription') }
          format.json { render :show, status: :created, location: @subscription }
          format.js
          UserMailer.subscription_successful(@subscription, Recipe.where(public: true).last(3)).deliver_now
          UserMailer.new_subscription(@subscription).deliver_now
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
    redirect_to basic_pages_index_path, notice: t('subscriptions.unsubscribe_successful')
  end

  def send_new_recipe_email
    @recipe = Recipe.find(params[:recipe_id])
    begin
      subscriptions = Subscription.all
      subscriptions.each do |subscription|
        UserMailer.new_recipe(@recipe, subscription).deliver_now
      end
      respond_to do |format|
        @recipe.new_recipe_email_sent = true
        @recipe.save
        format.html{ redirect_to @recipe, notice: "Email with the new recipe was sent successfully to all subscriptions"}
      end
    rescue Exception
      redirect_to( @recipe, notice: "Email with the new recipes was not able to be sent to subscriptions.")
    end

  end
  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def subscription_params
      params.require(:subscription).permit(:email, :language)
    end

    def subscription_errors
       # @subscription.errors.details[:email][0] == {:error=>:blank}
      if (@subscription.errors.full_messages[0].include?  "blank") || (@subscription.errors.full_messages[0].include? "κενό")
        @subscription_error = "blank"
      elsif  (@subscription.errors.full_messages[0].include?  "invalid") || (@subscription.errors.full_messages[0].include? "άκυρο")
        @subscription_error = "invalid"
      elsif (@subscription.errors.full_messages[0].include?  "taken") || (@subscription.errors.full_messages[0].include?  "χρησιμοποιήσει")
        @subscription_error = "taken"
      end
    end

end
