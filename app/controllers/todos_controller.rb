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
    if @todo.save
      redirect_to campaign_path(@campaign), notice: "Todo List Posted"
    else
      render :new
    end
  end

  private

  def params_todo
    params.require(:todo).permit(:items)
  end


end
