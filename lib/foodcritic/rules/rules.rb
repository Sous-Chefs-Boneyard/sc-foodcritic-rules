def ensure_file_exists(basepath, filepath)
  path = File.join(basepath, filepath)
  [file_match(path)] unless File.exist?(path)
end

rule "SC001", "Missing Berksfile" do
  tags %w{style berksfile sous_chefs}
  cookbook do |path|
    ensure_file_exists path, "Berksfile"
  end
end

rule "SC002", "Missing CHANGELOG in markdown format" do
  tags %w{style changelog sous-chefs}
  cookbook do |path|
    ensure_file_exists path, "CHANGELOG.md"
  end
end

rule "SC003", "Missing CODE_OF_CONDUCT in markdown format" do
  tags %w{style code_of_conduct sous-chefs}
  cookbook do |path|
    ensure_file_exists path, "CODE_OF_CONDUCT.md"
  end
end

rule "SC004", "Missing CONTRIBUTING in markdown format" do
  tags %w{style contributing sous-chefs}
  cookbook do |path|
    ensure_file_exists path, "CONTRIBUTING.md"
  end
end

rule "SC005", "Missing LICENSE" do
  tags %w{style license sous_chefs}
  cookbook do |path|
    ensure_file_exists path, "LICENSE"
  end
end

# TODO:
# rule 'SC008', 'Gemfile should depend on berkshelf'
# rule 'SC009', 'Gemfile should depend on chefspec'
# rule 'SC010', 'Gemfile should depend on cookstyle'
# rule 'SC011', 'Gemfile should depend on foodcritic'
# rule 'SC012', 'Gemfile should depend on stove'
# rule 'SC013', 'Gemfile should depend on test-kitchen'

# rule 'SC007', 'README should link to sous-chefs'
# README should link to travis
#+[![Build Status](https://travis-ci.org/sous-chefs/#{name}.svg)](https://travis-ci.org/sous-chefs/#{name})
# README should specify maintainer
# berkfile should source supermarket
#  +source 'https://supermarket.chef.io'
#
