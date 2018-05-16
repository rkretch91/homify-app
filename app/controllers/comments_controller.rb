class CommentsController < ApplicationController
  def index
    @comments = policy_scope(Comment)
  end

  def new
    @comment = Comment.new
    @user = current_user
    authorize @comment
  end

  def create
    if params[:todo_id]
      @parent = Todo.find(params[:todo_id])
    elsif params[:campaign_id]
      @parent = Campaign.find(params[:campaign_id])
    end

    @comment = @parent.comments.build(params_comment)
    @comment.user = current_user
    authorize @comment
    if @comment.save
      if @parent.is_a?(Todo) # template error with this included: (== params[:post_id])
        flash[:notice] = 'Comment saved successfully'
        redirect_to [@parent.campaign]
      elsif @parent.is_a?(Campaign)
        flash[:notice] = 'Comment saved successfully'
        redirect_to @parent
       end
    end
  end

  private

  def params_comment
    params.require(:comment).permit(:title, :user_id)
  end


end
