require "spec_helper"

describe Git::Open do
  it "has a version number" do
    expect(Git::Open::VERSION).not_to be nil
  end
end
