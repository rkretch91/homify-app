class TodosController < ApplicationController
  def index
    @todos = policy_scope(Todo)
  end

  def new
    @todo = Todo.new
    @campaign = Campaign.find(params[:campaign_id])
    @user = current_user
    authorize @todo
  end

  def create
    @todo = Todo.new(params_todo)
    @campaign = Campaign.find(params[:campaign_id])
    @todo.campaign = @campaign
    @user = current_user
    @todo.user = @user
    authorize @todo
    if @todo.save
      redirect_to campaign_path(@campaign), notice: "Todo List Posted"
    else
      render :new
    end
  end

  private

  def params_todo
    params.require(:todo).permit(:items, :campaign_id, :user_id)
  end


end
