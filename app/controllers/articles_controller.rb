class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])

    @comment = Comment.new
    @comment.article_id = @article.id
  end

  def new
    @article = Article.new
  end

  def create
  @article = Article.new(article_params)

  respond_to do |format|
    if @article.save
      format.html { redirect_to article_path(@article), notice: "Successfully created article" }
    else
      format.html { :new }
    end
  end  
end

  def destroy
    @article = Article.find(params[:id])

    @article.destroy
    respond_to do |format|     
      format.html { redirect_to :articles, notice: "Article was successfully destroyed!" }
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to article_path, notice: "Article has been updated" }
      else
        format.html { :new }
      end
    end
  end


  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
