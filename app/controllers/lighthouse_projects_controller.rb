class LighthouseProjectsController < ApplicationController
  def show
    @lighthouse_account = LighthouseAccount.find(params[:lighthouse_account_id])
    @lighthouse_project = @lighthouse_account.fetch_project(params[:id])

    @milestones = []
    @ticket_counts = []
    @lighthouse_project.milestones.each do |stone|
      @milestones << stone.title
      @ticket_counts << stone.tickets_count
    end

    respond_to do |wants|
      wants.json do
        render :json => {:milestones => @milestones, :ticket_counts => @ticket_counts}
      end
    end
  end
end
