class ReactionsController < ApplicationController
  before_action :authenticate_catuser!

    def new_catuser_reaction
        @catuser = current_catuser
        @type = params[:reaction_type]
        @article = Article.find(params[:article_id]) if params[:article_id]
        @catcomment = Catcomment.find(params[:catcomment_id]) if params[:catcomment_id]
        @kind = params[:kind]
        respond_to do |format|
            (@type == "catcomment") ? reaction_catcomment = Reaction.find_by(catuser_id: @catuser,
        catcomment_id: @catcomment.id) : reaction_article = Reaction.find_by(catuser_id: @catuser.id,
        article_id: @article.id)
        
            if reaction_article || reaction_catcomment
                format.html { redirect_to article_path(@article), notice: 'You already reacted
                to this article' }
                else
                (@type == "article") ? @reaction = Reaction.new(catuser_id: @catuser.id, article_id:
                @article.id, reaction_type: @type, kind: @kind) : @reaction = Reaction.new(catuser_id:
                @catuser.id, catcomment_id: @catcomment.id, reaction_type: @type, kind: @kind)
                if @reaction.save!
                format.html { redirect_to article_path(@article), notice: 'Reaction was
                successfully created.' }
                else
                format.html { redirect_to article_path(@article), notice: 'Something went
                wrong' }
                 end
               end
                end
              end
            end
