class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(titre: params[:article][:titre], message: params[:article][:message], photo: params[:article][:photo])
    @article.etablissement = Etablissement.first
    if @article.save
      flash[:success] = "Création article avec succès!"
      redirect_to articles_path
    else
      flash[:error] = "Champ invalide!"
      redirect_to new_article_path
    end
    #puts @a.valid?.inspect
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
