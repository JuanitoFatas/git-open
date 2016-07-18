require "git/open/version"

module Git
  module Open
    class CLI
      def self.execute
        require "slop"
        options = Slop.parse do |option|
          option.on "-h".freeze, "--help".freeze, "Show this help".freeze
          option.on "-v".freeze, "--version".freeze, "print the version".freeze do
            puts_and_exit "git-open version #{Git::Open::VERSION}"
          end
        end

        show_help(options) if options[:h] || options[:help] || ARGV.include?("help".freeze)

        abort("Not a git repo".freeze) if `git rev-parse --is-inside-work-tree`.chomp! != "true".freeze

        remotes = `git remote`.split("\n".freeze)

        abort("No remote found".freeze) if remotes.empty?

        url = if remotes.find { |remote| remote == "origin".freeze }
          `git config --get remote.origin.url`.chomp!
        else
          `git config --get remote.#{remotes.first}.url`.chomp!
        end

        require "git/remote/parser"; require "launchy"
        Launchy.open(open_url = Git::Remote::Parser.new.parse(url).html_url) do |exception|
          puts "Attempted to open `#{open_url.to_s}' and failed because #{exception}"
        end
      end

      def self.show_help(options)
        puts_and_exit(options)
      end

      def self.puts_and_exit(message)
        puts(message)
        exit
      end
    end
  end
end
