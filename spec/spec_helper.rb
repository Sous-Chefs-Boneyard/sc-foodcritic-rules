require "rspec"
require "foodcritic"

PROJECT_ROOT = File.expand_path(File.join(File.dirname(__FILE__), "../"))

def foodcritic_run(rule_name)
  fc = FoodCritic::Linter.new

  opts = {
    include_rules: [File.join(PROJECT_ROOT, "lib/foodcritic/rules")],
    # tags: ["sous-chefs"],
    # tags: ["sc002"],
    # cookbook_paths: File.join(PROJECT_ROOT, 'sample_cookbooks', rule_name.downcase)
    cookbook_paths: File.join(PROJECT_ROOT, "sample_cookbooks", rule_name.downcase),
  }

  fc.check(opts)
end

def warnings(fc_run)
  fc_run.warnings.collect { |w| File.basename(w.match[:filename]) }.uniq
end
