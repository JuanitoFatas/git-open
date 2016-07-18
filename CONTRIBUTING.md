# Contributing

First, thank you for contributing!

Here are a few technical guidelines to follow:

0. Open an [issue][] to discuss a new feature
0. Write tests
0. Make sure the entire test suite passes locally and on CI
0. Open a Pull Request
0. [Squash your commits][squash] after receiving feedback
0. Party!

[issue]: https://github.com/juanitofatas/git-open/issues
[squash]: https://github.com/thoughtbot/guides/tree/master/protocol/git#write-a-feature

## Development

After checking out the repo, run `bin/setup` to install dependencies.
Run `bin/hack` for an interactive prompt that will allow you to experiment.
To install this gem onto your local machine, run `bundle exec rake install`.

## Testing

0. Set up your `development` environment as per above.
0. Run `rake` to execute the full test suite.

## Release

To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).
