require 'spec_helper'

describe "SC001" do
  let(:fc_run) do
    foodcritic_run('sc001')
  end

  it "does not generate a warning about a missing Berksfile" do
    expect(warnings(fc_run)).to_not include('Berksfile')
  end
end

describe "SC002" do
  let(:fc_run) do
    foodcritic_run('sc002')
  end

  it "generates a warning about the changlog in the wrong format" do
    expect(warnings(fc_run)).to include('CHANGELOG')
  end

  it "does not generate a warning about the CHANGELOG.md file" do
    expect(warnings(fc_run)).to_not include('CHANGELOG.md')
  end
end

describe "SC003" do
  let(:fc_run) do
    foodcritic_run('sc003')
  end

  it "generates a warning about the code_of_conduct in the wrong format" do
    expect(warnings(fc_run)).to include('CODE_OF_CONDUCT')
  end

  it "does not generate a warning about the CHANGELOG.md file" do
    expect(warnings(fc_run)).to_not include('CODE_OF_CONDUCT.md')
  end
end

describe "SC004" do
  let(:fc_run) do
    foodcritic_run('sc004')
  end

  it "generates a warning about the contributing in the wrong format" do
    expect(warnings(fc_run)).to include('CONTRIBUTING')
  end

  it "does not generate a warning about the CHANGELOG.md file" do
    expect(warnings(fc_run)).to_not include('CONTRIBUTING.md')
  end
end

describe "SC005" do
  let(:fc_run) do
    foodcritic_run('sc005')
  end

  it "generates a warning about the missing LICENCE file" do
    expect(warnings(fc_run)).to include('LICENCE')
  end
end

describe "SC"
