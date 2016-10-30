QueryType = GraphQL::ObjectType.define do
  name 'Query'
  description 'The root level query type'

  field :articles, types[ArticleType] do
    argument :tag, types.String
<<<<<<< HEAD
    resolve -> (obj, args, ctx) do
      if args[:tag]
        tag = Tag.where(tag: args[:tag]).first
        tag.articles
      else
        Article.all
=======
    argument :first, types.Int

    resolve -> (obj, args, ctx) do
      articles = Article.where(status: 'published')
      if args[:tag]
        tag = Tag.where(tag: args[:tag]).first
        tag.articles.where(status: 'published')
      elsif args[:first]
        articles.first(args[:first])
      else
        articles
      end
    end
  end
  field :articleFeedCount, types.Int do
    resolve -> (obj, args, ctx) {
      Article.where(status: 'published', spotlighted: false).count
    }
  end
  field :articleFeed, types[ArticleType] do
    argument :first, types.Int
    resolve -> (obj, args, ctx) do
      articles = Article.where(spotlighted: false, status: 'published')
      if args[:first]
        articles.first(args[:first])
      else
        articles
>>>>>>> master
      end
    end
  end
  field :article, ArticleType do
    argument :id, types.ID
<<<<<<< HEAD
    resolve -> (obj, args, ctx) do
      article = Article.find_by(id: args[:id])
      article
=======
    argument :slug, types.String
    resolve -> (obj, args, ctx) do
      if args[:slug]
        Article.find_by(slug: args[:slug])
      else
        Article.find_by(id: args[:id])
      end
>>>>>>> master
    end
  end
  field :tags, types[TagType] do
    resolve -> (obj, args, ctx) do
      Tag.all
    end
  end
  field :tag, TagType do
    argument :id, types.ID
    resolve -> (obj, args, ctx) do
      tag = Tag.find_by(id: args[:id])
      tag
    end
  end
<<<<<<< HEAD
=======
  field :spotlightImages, types[SpotlightImageType] do
    resolve -> (obj, args, ctx) do
      SpotlightImage.all
    end
  end
  field :spotlightImage, SpotlightImageType do
    argument :id, types.ID
    resolve -> (obj, args, ctx) do
      image = SpotlightImage.find_by(id: args[:id])
      image
    end
  end
  field :authUser, AuthUserType do
    argument :auth_token, !types.String
    resolve -> (obj, args, ctx) do
      User.find_by(auth_token: args[:auth_token])
    end
  end
  field :publicUsers, types[UserType] do
    resolve -> (obj, args, ctx) do
      User.where(public: true)
    end
  end
  field :user, UserType do
    argument :id, !types.ID
    resolve -> (obj, args, ctx) do
      User.where(public: true, id: args[:id])
    end
  end
>>>>>>> master
end
