class BlogsController < ApplicationController
  # %i[ show edit update destroy ] = [:show, :edit, :update, :destroy]
  before_action :set_blog, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: :index


  # GET /blogs or /blogs.json
  def index
    @blogs = Blog.index_all.page(params[:page])
  end

  # GET /blogs/1 or /blogs/1.json
  def show
    @comment = Comment.new
    @comments = @blog.comments.page(params[:page]).per(7).reverse_order
    @favorite = current_user.favorites.find_by(blog_id: @blog.id)
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit; end

  # POST /blogs or /blogs.json
  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id #ブログを投稿した人 = 現在ログインしているユーザ
    respond_to do |format|
      if @blog.save
        NoticeMailer.sendmail_blog(@blog).deliver # 追記
        format.html { redirect_to blog_url(@blog), notice: 'Blog was successfully created.' }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1 or /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to blog_url(@blog.id), notice: 'Blog was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1 or /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_blog
    @blog = Blog.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def blog_params
    params.require(:blog).permit(:title, :content)
  end
end
