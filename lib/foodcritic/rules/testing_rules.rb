rule 'SC020', 'Missing .kitchen.yml' do
  tags %w(style kitchen sous_chefs sc020)
  cookbook do |path|
    ensure_file_exists path, '.kitchen.yml'
  end
end

rule 'SC021', 'Missing .travis.yml' do
  tags %w(style travis sous_chefs sc021)
  cookbook do |path|
    ensure_file_exists path, '.travis.yml'
  end
end
