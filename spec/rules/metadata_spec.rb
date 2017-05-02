require "spec_helper"

describe "SC014" do
  let(:fc_run) do
    foodcritic_run("sc014")
  end

  it "generates a warning against bad metadata" do
    expect(warnings(fc_run)).to include("incorrect.rb")
  end

  it "doesn't generate a warning against correct metadata" do
    expect(warnings(fc_run)).to_not include("correct.rb")
  end
end

describe "SC015" do
  let(:fc_run) do
    foodcritic_run("sc015")
  end

  it "generates a warning about an incorect issues_url" do
    expect(warnings(fc_run)).to include("metadata.rb")
  end
  #
  # it "doesn't generate a warning about an incorect issues_url" do
  #   expect(warnings(fc_run)).to_not include('correct.rb')
  # end
end

describe "SC016" do
  let(:fc_run) do
    foodcritic_run("sc016")
  end

  it "generates a warning about an incorect maintainer value" do
    expect(warnings(fc_run)).to include("metadata.rb")
  end
  #
  # it "doesn't generate a warning about an incorect maintainer" do
  #   expect(warnings(fc_run)).to_not include('correct.rb')
  # end
end

describe "SC017" do
  let(:fc_run) do
    foodcritic_run("sc017")
  end

  it "generates a warning about an incorrect maintainer email" do
    expect(warnings(fc_run)).to include("metadata.rb")
  end
  #
  # it "doesn't generate a warning abut a missing chef_version" do
  #   expect(warnings(fc_run)).to_not include('metadata.rb')
  # end
end

describe "SC018" do
  let(:fc_run) do
    foodcritic_run("sc018")
  end

  it "generates a warning against a missing chef_version" do
    expect(warnings(fc_run)).to include("metadata.rb")
  end
  #
  # it "doesn't generate a warning against correct metadata" do
  #   expect(warnings(fc_run)).to_not include('correct.rb')
  # end
end

describe "SC019" do
  let(:fc_run) do
    foodcritic_run("sc019")
  end

  it "generates a warning against metadata containing the attribute keyword" do
    expect(warnings(fc_run)).to include("metadata.rb")
  end
  #
  # it "doesn't generate a warning against correct metadata" do
  #   expect(warnings(fc_run)).to_not include('correct.rb')
  # end
end
