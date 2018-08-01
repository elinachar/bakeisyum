class CommentsController < ApplicationController
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @comment = @recipe.comments.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @recipe, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { redirect_to @recipe, alert: 'Comment was not saved successfully. Please enter your name and a comment on the recipe.' }
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
        @approved_comments = recipe.comments.where(:approved => true).count
        @not_approved_comments = recipe.comments.where(:approved => false).count
        format.html { redirect_to recipe, notice: 'Comment was approved.' }
        format.json { render :show, status: :created, location: @recipe }
        format.js
      else
        format.html { redirect_to recipe, alert: 'Comment was not approved.' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end

  end

  private
    def comment_params
      params.require(:comment).permit(:body, :cοmmentator)
    end

end
