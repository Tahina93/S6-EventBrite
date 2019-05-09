class UsersController < ApplicationController
  before_action :set_user, only: [:show, :destroy]
  before_action :authenticate_user!, only: [:show]
  before_action :is_current_user?, only: [:show]


  # GET /users/1
  # GET /users/1.json
  def show
    user = set_user
    @page_title = "Profil"
    if user.first_name || user.last_name
      @page_title << "de " + user.first_name + " " + user.last_name
    end
    @events = user.created_events
    @owned_events = user.
    
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :encrypted_password, :description, :first_name, :last_name)
    end

    def is_current_user?
     unless @user==current_user
      flash[:danger] = "Tu n'es pas cet utilisateur."
       redirect_to root_path
     end
   end

 end
