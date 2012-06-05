class RecipesController < ApplicationController
	before_filter :authenticate, :only => [:create, :destroy]
	before_filter :authorized_user, :only => :destroy

	def index
	end

	def create
		@recipe = current_user.recipes.build(params[:recipe])
		if @recipe.save
			flash[:success] = "Recipe created!"
			redirect_to root_path
		else
			@feed_items = []
			render 'pages/home'
		end
	end

	def destroy
		@recipe.destroy
		redirect_back_or root_path
	end

	private

	  def authorized_user
	  	@recipe = current_user.recipes.find_by_id(params[:id])
	  	redirect_to root_path if @recipe.nil?
	  end
end
