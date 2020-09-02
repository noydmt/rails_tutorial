class UsersController < ApplicationController
  
	def index
  end

	def new
	end

	def create
	end

	def edit
	end

  # GET /users/:id
	def show
	  # user = User.first #local var => only show action
		# @user = User.first #instance var => enable to use view(erb)
		# @@user = User.first #global var => don't use as possible as you can

		@user = User.find_by(id: params[:id])
	end

	def update
	end

	def destroy
	end
	
end
