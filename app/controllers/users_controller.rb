class UsersController < ApplicationController

  def index
    @users=User.all
  end

  def import
    User.import(params[:file])
    redirect_to root_url, notice: 'User Data imported'
  end

  def export_csv
    users = User.all

    respond_to do |format|
      format.csv do
        send_data users.to_csv, filename: "users_data_#{Time.now.to_i}.csv"
      end
    end
  end

end
