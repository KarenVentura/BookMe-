module Api::V1
  class UsersController < ApiController
    before_action :authenticate_with_token!, only: [:update, :destroy]
    before_action :set_user, only: [:show, :edit]

    def index
      render json: User.all
    end

    def show
      render json: @user
    end

    def create
      @user = User.new(user_params)

      if @user.save
        render json: @user, status: 201, location: [:api, user]
      else
        render json: { errors: @user.errors }, status: 422
      end
    end

    def update
      @user = current_user

      if @user.update(user_params)
        render json: @user, status: 200, location: [:api, @user]
      else
        render json: { errors: @user.errors }, status: 422
      end
    end

    def destroy
      current_user.destroy
      head 204
    end

    private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.required(:user).permit(:name, :last_name, :email, :telephone, :cellphone, :password, :password_confirmation) if params[:user]
    end
  end
end
