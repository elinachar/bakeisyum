class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /recipes
  # GET /recipes.json
  def index
    if params[:q]
      @search_term = params[:q]
      @recipes = Recipe.search(@search_term).distinct
    else
      @recipes = Recipe.all
    end
    @recipes = @recipes.paginate(:page => params[:page], :per_page => 6).order("id DESC")
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
    @descriptions = @recipe.descriptions.order(:id)
    @rating = @recipe.ratings.average(:rating)
    @parts = @recipe.parts.order(:id)
    @notes = @recipe.notes.order(:id)
    @comments = @recipe.comments.order("created_at DESC")
    # .paginate(:page => params[:page], :per_page => 5).order("created_at DESC")
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit
    @parts = @recipe.parts
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }

        subscriptions = Subscription.all
        subscriptions.each do |subscription|
          UserMailer.new_recipe(@recipe, subscription).deliver_now
        end
      else
        format.html { render :new }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find_by(name: params[:name].tr("-"," ").titleize)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:name, :short_description, :serving, :preparation_time, :cooking_time, :waiting_time, :original_recipie_author, :original_recipie_url, :image_url,
      descriptions_attributes: [:id, :description, :image_url, :_destroy],
      parts_attributes: [:id, :name, :_destroy,
      ingredients_attributes: [:id, :name, :weight, :weight_unit, :weight_optional, :weight_optional_unit, :_destroy],
      instructions_attributes: [:id, :instruction, :_destroy]],
      notes_attributes: [:id, :note, :_destroy])

    end
end
