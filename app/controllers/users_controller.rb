class UsersController < ApplicationController

	def index
  end

  # GET /users/new
	def new
	  @user = User.new
	end
  
  # POST /users(+ params)
	def create
	  @user = User.new(user_params)
		if @user.save
		  redirect_to new_user_path
		else
      render 'new'
		end
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
	
  private

	def user_params
	  # params のどの key を使用するのか限定する
    # 悪意を持ったユーザーがparams[:user]の中の他のkeyをいじって送信しても受け取れないように。
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
	end

end
