class ArticlesController < ApplicationController
  
  
  def index
    @articles = Article.all
  end
  
  def new
    @article = Article.new
  end
  
    
  def edit
    @article = Article.find(params[:id])
  end


  def create
    #The browser sends information (model variable values) to the controller 
    #through the params hash 
    
    #render plain: params[:article].inspect //return the contents of the hash as a string
    
    #need to whitelist the information passed from the browser before saving
    #article_params method will do that
    @article = Article.new(article_params) # this instance variables has the whitelisted (permitted) values
    
    if @article.save
      flash[:notice] = "Article was succesfully created"
      redirect_to article_path(@article)
    else
      render "new"
    end
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  def update
    @article = Article.find(params[:id])
    
     if @article.update(article_params)
      flash[:notice] = "Article was succesfully updated"
      redirect_to article_path(@article)
    else
      render "edit"
    end
    
  end

  
  private 
    def article_params
      params.require(:article).permit(:title, :description)
    end

  
end