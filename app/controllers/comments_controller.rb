class CommentsController < ApplicationController
  def create
    blog = Blog.find(params[:blog_id])
    comment = current_user.comments.new(comment_params)
    comment.blog_id = blog.id
    comment.save
    respond_to do |format|
      format.html { redirect_to  blog_path(blog), notice: 'Comment was successfully created.' }
      format.json { head :no_content }
    end
  end

  def destroy
    Comment.find_by(id: params[:id], blog_id: params[:blog_id]).destroy
    respond_to do |format|
      format.html { redirect_to  blog_path(params[:blog_id]), notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
