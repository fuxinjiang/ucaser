class ArticlesController < ApplicationController
    http_basic_authenticate_with name: "tiger", password: "tiger", only: :destroy
    
    def index
        @articles = Article.all
    end
    
    def new
      @article = Article.new
    end
    
    def edit
      @article = Article.find(params[:id])
    end
    
    def show
        @article = Article.find(params[:id])
    end
    
    def create
      @article = Article.new(article_params)
     
      if @article.save
        redirect_to @article
      else
        @id = @article[:id]
        render 'new'
      end
    end
 
    def update
      @article = Article.find(params[:id])
     
      if @article.update(article_params)
        redirect_to @article
      else
        render 'edit'
      end
    end
    
    def destroy
      @article = Article.find(params[:id])
      @article.destroy
     
      redirect_to articles_path
    end
 
    private
      def article_params
        params.require(:article).permit(:title, :label, :text)
      end
end
