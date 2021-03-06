class UsersController < ApplicationController
	def my_portfolio
		@user = current_user
		@user_stocks = current_user.stocks
	end

	def my_friends
		@friendships = current_user.friends
	end

	def search
		if params[:search_params].blank?
			flash.now[:danger] = "You have entered an empty search string"
		else	
			@users = User.search(params[:search_params])
			flash.now[:danger] = "No results" if @users.blank?
		end
		respond_to do |format|
			format.js { render partial: 'friends/result'}
		end
	end
end