class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ edit update destroy ]
  before_action :set_blog, only: %i[ destroy ]

  def create
    #リファクタ中
    # @blog = Blog.find(params[:blog_id])
    comment = current_user.comments.new(comment_params)
    # comment.blog_id = @blog.id
    if comment.save
      respond_to do |format|
        format.html { redirect_back fallback_location: root_path, notice: 'Comment was successfully created.' }
        format.json { head :no_content }
      end
    else
      redirect_to root_path
    end
  end

  def edit

  end


  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to blog_url(@comment.blog_id), notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @comment.destroy
      respond_to do |format|
        format.html { redirect_to blog_path(@blog), notice: 'Comment was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      redirect_to root_path
    end
  end

  private

  def set_blog
    @blog = Blog.find(params[:blog_id])
  end

  def set_comment
    @comment = Comment.find_by(id:params[:id], blog_id: params[:blog_id])
  end

  def comment_params
    params.require(:comment).permit(:comment, :blog_id)
  end

end
