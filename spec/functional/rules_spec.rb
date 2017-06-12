require "spec_helper"

describe "SC001" do
  context "Generates a warning about a missing Berksfile" do
    fixture_file "sc002"
    it { is_expected.to violate_rule("SC001") }
  end

  context "Does not generate a warning about a missing Berksfile" do
    fixture_file "sc001"
    it { is_expected.to_not violate_rule("SC001") }
  end
end

describe "SC002" do
  context "Generates a warning about the changlog in the wrong format" do
    fixture_file "missing_files"
    it { is_expected.to violate_rule("SC002") }
  end

  context "Doesn't generate a warning about the CHANGELOG.md file" do
    fixture_file "sc002"
    it { is_expected.to_not violate_rule('SC002') }
  end
end

describe "SC003" do
  # context "generates a warning about the code_of_conduct in the wrong format" do
  #   fixture_file "missing_files"
  #   it { is_expected.to violate_rule('SC003') }
  # end

  context "does not generate a warning about the code_of_conduct file" do
    fixture_file "sc003"
    it { is_expected.to_not violate_rule('SC003') }
  end
end

# describe "SC004" do
#   it "generates a warning about the contributing in the wrong format" do
#     expect(warnings(fc_run)).to include("CONTRIBUTING")
#   end
#
#   it "does not generate a warning about the CHANGELOG.md file" do
#     expect(warnings(fc_run)).to_not include("CONTRIBUTING.md")
#   end
# end
#
# describe "SC005" do
#   it "generates a warning about the missing LICENCE file" do
#     expect(warnings(fc_run)).to include("LICENCE")
#   end
# end
#
# describe "SC"
