install:
	bundle install

test:
	bundle exec rspec

lint:
	bundle exec rubocop

ac:
	bundle exec rubocop -a
