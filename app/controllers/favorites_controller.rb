class FavoritesController < ApplicationController
  before_action :set_favorite, only: [:show, :edit, :update, :destroy]

  # GET /favorites
  # GET /favorites.json
  def index
    @favorites = Favorite.all.where(user: current_user)
    @recipes = Recipe.find(@favorites.pluck(:recipe_id))
  end

  # GET /favorites/1
  # GET /favorites/1.json
  def show
  end

  # GET /favorites/new
  def new
    @favorite = Favorite.new
  end

  # GET /favorites/1/edit
  def edit
  end

  # POST /favorites
  # POST /favorites.json
  def create
    @favorite = Favorite.new(user_id: params[:user_id], recipe_id: params[:recipe_id])
    @recipe = @favorite.recipe
    @favorites = current_user.favorites.pluck(:id)

    respond_to do |format|
      if @favorite.save
        format.html { redirect_to @recipe, notice: 'Favorite was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
        format.js
      else
          format.html { redirect_to @recipe, alert: 'Favorite was not created.' }
        format.json { render json: @favorite.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /favorites/1
  # PATCH/PUT /favorites/1.json
  def update
    respond_to do |format|
      if @favorite.update(favorite_params)
        format.html { redirect_to @favorite, notice: 'Favorite was successfully updated.' }
        format.json { render :show, status: :ok, location: @favorite }
      else
        format.html { render :edit }
        format.json { render json: @favorite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favorites/1
  # DELETE /favorites/1.json
  def destroy
    @recipe = @favorite.recipe
    @favorite.destroy
    respond_to do |format|
      format.html { redirect_to @recipe, notice: 'Favorite was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorite
      @favorite = Favorite.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def favorite_params
      params.fetch(:favorite, {})
    end
end
