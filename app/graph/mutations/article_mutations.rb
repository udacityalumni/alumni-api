module ArticleMutations
<<<<<<< HEAD
=======
  Create = GraphQL::Relay::Mutation.define do
    name 'CreateArticle'
    input_field :auth_token, !types.String
    input_field :article, ArticleInputType

    return_field :article, ArticleType

    resolve -> (inputs, ctx) do
      user = User.find_by(auth_token: inputs[:auth_token])
      article_inputs = inputs[:article]
      if user
        article = Article.create(
          title: article_inputs[:title],
          content: article_inputs[:content],
          json: article_inputs[:json],
          status: article_inputs[:status],
          spotlighted: article_inputs[:spotlighted]
        )
        article.user = user
        article.feature_image = article_inputs[:feature_image] if article_inputs[:feature_image]
        if article_inputs[:tags]
          article_inputs[:tags].to_a.each do |tag|
            tag = Tag.find_or_create_by(tag: tag.to_h["tag"])
            article.tags << tag
          end
        end
        # Make sure tags are unique
        article.tags = article.tags.uniq{ |art| art.tag }
        article.save!
        {
          article: article
        }
      end
    end
  end
>>>>>>> master
  Update = GraphQL::Relay::Mutation.define do
    name 'UpdateArticle'
    input_field :auth_token, !types.String
    input_field :id, !types.ID
    input_field :article, ArticleInputType

    return_field :article, ArticleType
    resolve -> (inputs, ctx) do
      user = User.find_by(auth_token: inputs[:auth_token])
<<<<<<< HEAD
      article_inputs = inputs[:article].to_h
      if user
        article = Article.find_by_id(inputs[:id])
        article.update(article_inputs)
        article.save!
=======
      article_inputs = inputs[:article]
      if user
        article = Article.find_by_id(inputs[:id])
        article.update(
          title: article_inputs[:title],
          content: article_inputs[:content],
          json: article_inputs[:json],
          status: article_inputs[:status],
          spotlighted: article_inputs[:spotlighted]
        )
        article.user = user
        article.feature_image = article_inputs[:feature_image] if article_inputs[:feature_image]
        if article_inputs[:tags]
          article_inputs[:tags].to_a.each do |tag|
            tag = Tag.find_or_create_by(tag: tag.to_h["tag"])
            article.tags << tag
          end
        end
        # Make sure tags are unique
        article.tags = article.tags.uniq{ |art| art.tag }
        article.save!
        {
          article: article
        }
      end
    end
  end
  Delete = GraphQL::Relay::Mutation.define do
    name 'DeleteArticle'
    input_field :auth_token, !types.String
    input_field :id, !types.ID
    return_field :deleted_id, types.ID
    resolve -> (inputs, ctx) do
      article = Article.find_by_id(inputs[:id])
      id = article.id
      if article.destroy
        {
          deleted_id: id
        }
>>>>>>> master
      end
    end
  end
end
