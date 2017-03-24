require 'spec_helper'

describe 'SC014' do
  let(:fc_run) do
    foodcritic_run('sc014')
  end

  it "generates a warning against bad metadata" do
    expect(warnings(fc_run)).to include('incorrect.rb')
  end

  it "doesn't generate a warning against correct metadata" do
    expect(warnings(fc_run)).to_not include('correct.rb')
  end
end

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
