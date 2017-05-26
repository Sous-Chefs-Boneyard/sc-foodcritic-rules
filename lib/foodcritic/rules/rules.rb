def ensure_file_exists(basepath, filepath)
  path = File.join(basepath, filepath)
  [file_match(path)] unless File.exist?(path)
end
