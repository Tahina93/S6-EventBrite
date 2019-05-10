class Admin::UsersController < Admin::Controller
  def index
    @users = User.all
    puts @users
  end
end
