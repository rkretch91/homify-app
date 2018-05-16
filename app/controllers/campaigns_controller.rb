class CampaignsController < ApplicationController
  def index
    @campaigns = policy_scope(Campaign)
  end

  def show
    @campaign = Campaign.find(params[:id])
    authorize @campaign
  end

  def new
    @campaign = Campaign.new
    @user = current_user
    authorize @campaign
  end

  def create
    @campaign = Campaign.new(params_campaign)
    @user = current_user
    @campaign.user = @user
    authorize @campaign
    if @campaign.save
      redirect_to campaign_path(@campaign), notice: "Campaign Added to System"
    else
      render :new
    end
  end
  private

  def params_campaign
    params.require(:campaign).permit(:title, :tags, :estimated_duration, :user_id)
  end
end
