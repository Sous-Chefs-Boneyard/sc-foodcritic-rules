### Berksfile ###
#

rule 'SC001', 'Missing Berksfile' do
  tags %w(style berksfile sous_chefs)
  cookbook do |path|
    ensure_file_exists path, 'Berksfile'
  end
end
# berkfile should source supermarket
#  +source 'https://supermarket.chef.io'
#
rule 'SC015', 'metadata.rb should use sous-chefs style issues_url' do
  tags %w(metadata supermarket chef12)
  metadata do |ast, filename|
    name = field_value(ast, 'name')
    expected = "https://github.com/sous-chefs/#{name}/issues"
    [file_match(filename)] unless field_value(ast, 'issues_url') == expected
  end
end

# cf CINK001
rule 'SC002', 'Missing CHANGELOG in markdown format' do
  tags %w(style changelog sous-chefs)
  cookbook do |path|
    ensure_file_exists path, 'CHANGELOG.md'
  end
end

# rule 'SC003', 'CHANGELOG should follow keepachangelog.com format'

rule 'SC004', 'Missing CODE_OF_CONDUCT in markdown format' do
  tags %w(style code_of_conduct sous-chefs)
  cookbook do |path|
    ensure_file_exists path, 'CODE_OF_CONDUCT.md'
  end
end

rule 'SC005', 'Missing CONTRIBUTING in markdown format' do
  tags %w(style contributing sous-chefs)
  cookbook do |path|
    ensure_file_exists path, 'CONTRIBUTING.md'
  end
end

### Gemfile ###

# rule 'SC008', 'Gemfile should depend on berkshelf'
# rule 'SC009', 'Gemfile should depend on chefspec'
# rule 'SC010', 'Gemfile should depend on cookstyle'
# rule 'SC011', 'Gemfile should depend on foodcritic'
# rule 'SC012', 'Gemfile should depend on stove'
# rule 'SC013', 'Gemfile should depend on test-kitchen'

rule 'SC006', 'Missing LICENSE' do
  tags %w(style license sous_chefs)
  cookbook do |path|
    ensure_file_exists path, 'LICENSE'
  end
end

### README.md ###

# rule 'SC007', 'README should link to sous-chefs'
# README should link to travis
#+[![Build Status](https://travis-ci.org/sous-chefs/#{name}.svg)](https://travis-ci.org/sous-chefs/#{name})
# README should specify maintainer

### metadata.rb ###

# cf FC064
rule 'SC014', 'metadata.rb should use sous-chefs style source_url' do
  tags %w(metadata supermarket chef12)
  metadata do |ast, filename|
    name = field_value(ast, 'name')
    expected = "https://github.com/sous-chefs/#{name}"
    [file_match(filename)] unless field_value(ast, 'source_url') == expected
  end
end

# cf FC065
rule 'SC015', 'metadata.rb should use sous-chefs style issues_url' do
  tags %w(metadata supermarket chef12)
  metadata do |ast, filename|
    name = field_value(ast, 'name')
    expected = "https://github.com/sous-chefs/#{name}/issues"
    [file_match(filename)] unless field_value(ast, 'issues_url') == expected
  end
end

rule 'SC016', 'metadata.rb should use sous-chefs style maintainer' do
  tags %w(metadata supermarket chef12)
  metadata do |ast, filename|
    expected = 'Sous Chefs'
    [file_match(filename)] unless field_value(ast, 'maintainer') == expected
  end
end

rule 'SC017', 'metadata.rb should use sous-chefs style maintainer_email' do
  tags %w(metadata supermarket chef12)
  metadata do |ast, filename|
    expected = 'help@sous-chefs.org'
    [file_match(filename)] unless field_value(ast, 'maintainer_email') == expected
  end
end

rule 'SC018', 'metadata.rb should specify chef_version' do
  tags %w(metadata supermarket chef12)
  metadata do |ast, filename|
    [file_match(filename)] unless field_value(ast, 'chef_version')
  end
end

rule 'SC019', 'metadata should not contain "attribute" keyword' do
  tags %w(metadata supermarket chef12)
  metadata do |ast, filename|
    [file_match(filename)] if field(ast, 'attribute').any?
  end
end

rule 'SC020', 'Missing .kitchen.yml' do
  tags %w(style kitchen sous_chefs)
  cookbook do |path|
    ensure_file_exists path, '.kitchen.yml'
  end
end

rule 'SC021', 'Missing .travis.yml' do
  tags %w(style travis sous_chefs)
  cookbook do |path|
    ensure_file_exists path, '.travis.yml'
  end
end

# helpers

def ensure_file_exists(basepath, filepath)
  path = File.join(basepath, filepath)
  [file_match(path)] unless File.exist?(path)
end
