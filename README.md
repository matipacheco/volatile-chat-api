# Volatile chat API

    rvm gemset create volatile-chat-api
    rvm gemset use volatile-chat-api

## Manually test the publish endpoint

    query_string = "
      mutation sendMessage($body: Json!){
        sendMessage(body: $body) {
          result
          errors
        }
      }
    "

    VolatileChatApiSchema.execute(
        query_string,
        variables: {
            body: {
                sender: "mati",
                receiver: "maca",
                message: "<3"
            }
        }
    )

## Resources

- [Gemfile](https://bundler.io/man/gemfile.5.html)
- [Redis Pub/Sub](https://thoughtbot.com/blog/redis-pub-sub-how-does-it-work)
- [GraphQL Ruby](https://graphql-ruby.org/)
- [Rspec Rails](https://github.com/rspec/rspec-rails)
- [Testing GraphQL Mutations In Ruby On Rails With RSpec](https://selleo.com/blog/testing-graphql-mutations-in-ruby-on-rails-with-rspec)
- [Using Factory Bot without ORM](https://thoughtbot.com/blog/tips-for-using-factory-girl-without-an-orm)
