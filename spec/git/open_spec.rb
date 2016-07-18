require "spec_helper"

RSpec.describe Git::Open do
  it "has a version number" do
    expect(Git::Open::VERSION).not_to be nil
  end
end

RSpec.describe Git::Open::CLI do
  it "works for origin" do
    expect(Launchy).to receive(:open).with("https://github.com/JuanitoFatas/git-open")

    Git::Open::CLI.execute
  end

  it "fallback if origin not found" do
    `git remote remove origin`
    `git remote add upstream https://github.com/EvilJuanitoFatas/git-open.git`

    expect(Launchy).to receive(:open).with("https://github.com/EvilJuanitoFatas/git-open")

    Git::Open::CLI.execute

    `git remote add origin git@github.com:JuanitoFatas/git-open.git`
    `git remote remove upstream`
  end

  context "something went wrong with the Git::Remote::Parser" do
    it "prints exception" do
      expect(Git::Remote::Parser).to receive_message_chain(:new, :parse, :html_url) { nil }

      expect { Git::Open::CLI.execute }.to output(/Attempted to open/).to_stdout
    end
  end
end
