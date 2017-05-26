require 'spec_helper'

describe "SC014" do
  context "generates a warning against an incorrect source_url" do
    fixture_file 'sc014/incorrect.rb'
    it { is_expected.to violate_rule("SC014") }
  end
  # context "doesn't generate a warning against correct.rb's spec file" do
  # end
end
