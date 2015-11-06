# Codewars API Client

[Codewars API](http://dev.codewars.com)

## Installation

Add this line to your application's Gemfile `gem 'codewars_api'`

And then execute `$ bundle`

Or install it yourself as `$ gem install codewars_api`

## Usage

[RDoc](http://www.rubydoc.info/github/Evmorov/codewars_api_client)

```ruby
client = CodewarsApi::Client.new(api_key: your_api_key)

train_next_kata = client.train_next_kata(language: language)
train_next_kata.code_setup
# => 'function toInteger(n) {}'

attempt_solution = client.attempt_solution(
  project_id: train_next_kata.project_id,
  solution_id: train_next_kata.solution_id,
  code: solution_code
)

10.times do
  deferred_response = client.deferred_response(dmid: attempt_solution.dmid)
  break if deferred_response.success
  sleep 1
end

if deferred_response.valid
  client.finalize_solution(
    project_id: train_next_kata.project_id,
    solution_id: train_next_kata.solution_id
  )
else
  warn deferred_response.reason
  # => '-e: Value is not what was expected (Test::Error)'
end
```

#### Gem structure

API endpoint                   | Wrapper class (in CodewarsApi::) | Client's method to get an instance
------------------------------ | -------------------------------- | --------------------------------
GET User                       | User                             | #user
GET Code Challenge             | KataInfo                         | #kata_info
POST Train Next Code Challenge | TrainNextKata                    | #train_next_kata
POST Train Code Challenge      | TrainSpecificKata                | #train_specifc_kata
POST Attempt Solution          | AttemptSolution                  | #attempt_solution
POST Finalize Solution         | FinalizeSolution                 | #finalize_solution
GET Deferred Response          | DeferredResponse                 | #deferred_response

## Development

#### Check API methods

API documentation is a bit out of date. Tests in api_spec.rb make real request and check keys of json in a response against fixture/.json files. If you run these tests often (more then twice per second) your IP can be banned.

Execute to run the tests

`CHECK_API=true API_KEY=your_key USERNAME=any_user bundle exec rspec spec/api_spec.rb`

## Contributing

Bug reports, pull requests and ideas are welcome!

Steps to make a pull request:

1. Fork it ( https://github.com/Evmorov/codewars_api_client/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Make changes
4. Add tests for it
5. Commit your changes (`git commit -am 'Add some feature'`)
6. Push to the branch (`git push origin my-new-feature`)
7. Create a new Pull Request
