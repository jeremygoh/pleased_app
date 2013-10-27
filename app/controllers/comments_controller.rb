class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @patient = @comment.patient
    if @comment.save
      flash[:success] = "Comment added successfully"
      redirect_to '/patients/' + @comment.patient.id.to_s
    else
      flash[:error] = @comment.errors.full_messages[0]
      redirect_to patient_url(@patient)
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(comment_params)
      flash[:success] = "Comment updated successfully"
      redirect_to '/patients/' + @comment.patient.id.to_s
    else
      render 'edit'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    patient_id = @comment.patient.id.to_s
    @comment.destroy
    flash[:success] = "Comment deleted."
    redirect_to '/patients/' + patient_id
  end

  def comment_params
    params.require(:comment).permit(:comment, :patient_id, :meeting_id)
  end

end
