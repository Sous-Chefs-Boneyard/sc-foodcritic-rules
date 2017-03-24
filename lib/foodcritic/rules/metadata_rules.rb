# cf FC064
rule 'SC014', 'metadata.rb should use sous-chefs style source_url' do
  tags %w(metadata supermarket chef12 sc014)
  metadata do |ast, filename|
    name = field_value(ast, 'name')
    expected = "https://github.com/sous-chefs/#{name}"
    [file_match(filename)] unless field_value(ast, 'source_url') == expected
  end
end

# cf FC065
rule 'SC015', 'metadata.rb should use sous-chefs style issues_url' do
  tags %w(metadata supermarket chef12 sc015)
  metadata do |ast, filename|
    name = field_value(ast, 'name')
    expected = "https://github.com/sous-chefs/#{name}/issues"
    [file_match(filename)] unless field_value(ast, 'issues_url') == expected
  end
end

rule 'SC016', 'metadata.rb should use sous-chefs style maintainer' do
  tags %w(metadata supermarket chef12 sc016)
  metadata do |ast, filename|
    expected = 'Sous Chefs'
    [file_match(filename)] unless field_value(ast, 'maintainer') == expected
  end
end

rule 'SC017', 'metadata.rb should use sous-chefs style maintainer_email' do
  tags %w(metadata supermarket chef12 sc017)
  metadata do |ast, filename|
    expected = 'help@sous-chefs.org'
    [file_match(filename)] unless field_value(ast, 'maintainer_email') == expected
  end
end

rule 'SC018', 'metadata.rb should specify chef_version' do
  tags %w(metadata supermarket chef12 sc018)
  metadata do |ast, filename|
    [file_match(filename)] unless field_value(ast, 'chef_version')
  end
end

rule 'SC019', 'metadata should not contain "attribute" keyword' do
  tags %w(metadata supermarket chef12 sc019)
  metadata do |ast, filename|
    [file_match(filename)] if field(ast, 'attribute').any?
  end
end
