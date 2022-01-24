## SALES TAXES

### Local Setup
1. Please install [Bundler](https://bundler.io). 
2. Then run `bundle install` in terminal to install all required gems.

Ruby and Gem versions used in this project: 

- Ruby verion 2.6.3p62 - [RVM](https://github.com/rvm/rvm) or [rbenv](https://github.com/rbenv/rbenv) can be used to manage Ruby versions.
- [Rspec](https://rspec.info) version 3.0.

### Run Script

The `app/app.rb` file contains all the code required to re-create the 3 input scenarios from the brief.

There are two ways to run the script: 

From the **VSCode terminal**:

- `ruby app/app.rb` will print the 3 receipt outputs.

From outside the **VSCode terminal**:

1. Navigate to the project directory.
2. Then run `ruby app/app.rb` to print the 3 receipt outputs.

### Specs

Rspec is used for specs. There are two ways to run specs for this project. 

From the **VSCode terminal**:

- `bundle exec rspec` will run all specs
- `bundle exec rspec spec/basket_spec.rb` to run specs on individual files

From outside the **VSCode terminal**:

1. Navigate to the project directory.
2. Then type in `bundle exec rspec` to run all specs.

### Improvements

If more time was available, it would be nice to have the following:

1. Allow product quantities to be dynamically controlled in the basket.
2. Further abstraction, by thinking about implementing a third class used purely for taxation purposes. This maybe even be shared by the `Product` and `Basket` classes depending on how much more functionality is needed in the future.
3. Add more to the Gemfile to improve setup experience.