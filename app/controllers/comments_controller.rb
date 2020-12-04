class CommentsController < ApplicationController
  def create
    # byebug
    # @recipe = Recipe.find_by(name: params[:recipe_name].tr("-"," ").titleize)
    @recipe =  Recipe.friendly.find(params[:recipe_id])
    @comment = @recipe.comments.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @recipe, notice: t('recipes.show.comment_successfully_created') }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { redirect_to @recipe, alert: t('recipes.show.comment_was_not_created') }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    recipe = @comment.recipe
    @comment.destroy
    redirect_to recipe
  end

  def approve
    @comment = Comment.find(params[:comment_id])
    recipe = @comment.recipe
    @comment.update_attribute(:approved, true)
    respond_to do |format|
      if @comment.save
        @approved_comments = recipe.comments.where(:approved => true).size
        @not_approved_comments = recipe.comments.where(:approved => false).size
        format.html { redirect_to recipe, notice: t('recipes.show.comment_approved') }
        format.json { render :show, status: :created, location: @recipe }
        format.js
      else
        format.html { redirect_to recipe, alert: t('recipes.show.comment_not_approved') }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end

  end

  private
    def comment_params
      params.require(:comment).permit(:body, :cοmmentator)
    end

end
