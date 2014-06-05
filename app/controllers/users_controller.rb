class UsersController < ApplicationController

  respond_to :js

def new
	@user = User.new
end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Bem vindo, divirta-se!"
      redirect_to @user
    else
      render 'new'
    end
  end

  

def show
	@user = User.find(params[:id])

end

def index
  @users = User.all
end

def edit
	@user = User.find(params[:id])
end

def update
	@user = User.find(params[:id])
	if @user.update(user_params.permit(:password, :password_confirmation, :telefone, :endereco, :nome))
	redirect_to @user
	else
	render 'edit'
	end
end

def destroy
	byebug
  @user = User.find(params[:id])
  @user.destroy

	respond_to do |format|
	format.js { head :ok }
	end
end

private

    def user_params
      params.require(:user).permit(:nome, :email, :cpf, :password,
                                   :password_confirmation, :telefone, :endereco, :carteira)
    end
end
