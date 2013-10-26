class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    if @comment.save
      flash[:success] = "Comment added successfully"
      redirect_to '/patients/' + @comment.patient.id.to_s
    else
      render 'new'
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(comment_params)
      flash[:success] = "Comment updated successfully"
      redirect_to @patient
    else
      render 'edit'
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    flash[:success] = "Comment deleted."
    redirect to coments_path
  end

  def comment_params
    params.require(:comment).permit(:comment, :patient_id, :meeting_id)
  end

end
