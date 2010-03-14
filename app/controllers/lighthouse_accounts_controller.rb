class LighthouseAccountsController < ApplicationController

  def show
    @lighthouse_account = LighthouseAccount.find(params[:id])
    @projects = @lighthouse_account.fetch_projects
  end

  def new
    @lighthouse_account = LighthouseAccount.new
  end

  def create
    @lighthouse_account = LighthouseAccount.new(params[:lighthouse_account])
    if @lighthouse_account.save
      redirect_to lighthouse_account_url(@lighthouse_account)
    else
      render :action => :new
    end
  end
end
