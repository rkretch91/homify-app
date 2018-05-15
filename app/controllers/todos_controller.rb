class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
    @campaign = Campaign.find(params[:campaign_id])
  end

  def create
    @todo = Todo.new(params_todo)
    @campaign = Campaign.find(params[:campaign_id])
    @todo.campaign = @campaign
    @todo.save
  end

  private

  def params_todo
    params.require(:todo).permit(:items, :campaign_id)
  end


end
