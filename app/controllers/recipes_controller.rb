class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /recipes
  # GET /recipes.json
  def index
    if !current_user.nil? && current_user.admin?
      @recipes = Recipe.all
    else
      @recipes = Recipe.where(public: true)
    end

    # Return recipes that have all the terms in the search
    # F.e. if the user searches for "vegan recipes"
    # It will return all the recipes that include "vegan" and "recipes"
    # If I search for "vegan" or "recipes" it will return almost all recipes
    # becaule all of them have the word "recipe" inside.
    # Steps for searching:
    # 1. gets all recipes that are public
    # 2. from public recipes get the recipes with the first search term
    # 3. from public recipes with the first search term get the recipes with the second search term
    # 4. etc for the next search terms
    if params[:q]
      @search_term = params[:q]
      # search_terms = @search_term.split(/\W+/)
      search_terms = @search_term.split(" ")
      search_terms.each do |term|
        @recipes = @recipes.search(term).distinct
      end
    end

    @recipes = @recipes.order("id DESC")
    if params[:recipes_id].nil?
      @recipes = @recipes.first(6)
    else
      @new_recipes = @recipes.where("id < ?", params[:recipes_id][-1]).first(6)
      @recipes = @recipes.where("id >= ?", @new_recipes.pluck(:id)[-1])
      respond_to do |format|
        format.html
        format.js
      end
    end

  end


  # GET /recipes/1
  # GET /recipes/1.json
  def show
    @descriptions = @recipe.descriptions
    @rating = @recipe.ratings.average(:rating)
    unless current_user.nil?
      @favorites = current_user.favorites.pluck(:recipe_id)
      @favorite =  @recipe.favorites.where(user: current_user)[0]
    end
    @parts = @recipe.parts
    @notes = @recipe.notes
    @comments = @recipe.comments.order("created_at DESC")
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
      I18n.locale = params[:locale]
      @recipe = Recipe.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:name, :slug, :short_description, :serving, :preparation_time, :cooking_time, :waiting_time, :original_recipie_author, :original_recipie_url, :photos_from, :photos_from_url, :image_url, :square_image_url, :public, :cuisine, :keywords, :new_recipe_email_sent, :ingredients_image_url, :ingredients_text_image_url, :video_url,
      descriptions_attributes: [:id, :description, :image_url, :_destroy],
      parts_attributes: [:id, :name, :_destroy,
      ingredients_attributes: [:id, :name, :weight, :weight_unit, :weight_optional, :weight_optional_unit, :_destroy],
      instructions_attributes: [:id, :instruction, :_destroy]],
      notes_attributes: [:id, :note, :_destroy])

    end
end
