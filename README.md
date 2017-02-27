# Sous-Chefs Foodcritic Rules

Here lie [foodcritic](http://foodcritic.io/) rules to keep Sous-Chefs cookbooks similar.

## Usage

The simplest thing that could possibly work:

```
git submodule add https://github.com/sous-chefs/sc-foodcritic-rules.git foodcritic/sc
foodcritic -I foodcritic/sc .
```

For more standard usage you'll want to install these rules as a Rake task.

Inside the cookbook repository, install the rules as a git submodule into `foodcritic/sc`:
```
git submodule add https://github.com/sous-chefs/sc-foodcritic-rules.git foodcritic/sc
```

Then in the `Rakefile`, ensure the `include_rules` option is set to include `foodcritic/sc`:
```
require 'foodcritic'

desc 'Run Chef style checks'
FoodCritic::Rake::LintTask.new(:chef) do |t|
  t.options = {
    include_rules: 'foodcritic/sc',
    fail_tags: ['any'],
    progress: true,
  }
end
```

Finally, verify that the rules are in affect by running:
```
rake style:chef
```
