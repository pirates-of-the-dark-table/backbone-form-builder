desc "Runs the test suite"
task :default => :compile do
  files = Dir.glob("test/**/*_test.coffee")
  exec "mocha --reporter dot #{files.join " "}"
end

task :compile => [:compile_scripts, :compress]

task :compile_scripts do
  files = [
    'form_builder',
    'form_builder/form',
    'form_builder/fields',
    'form_builder/fields/*',
    'form_builder/buttons',
    'form_builder/buttons/*'
  ].map { |path| Dir.glob("src/#{path}.coffee") }.flatten
  system("coffee --lint --join compiled/backbone_form_builder.js --compile --output compiled #{files.join(" ")}")
end

task :compress do
  if File.exists?('compiled/backbone_form_builder.min.js')
    `rm compiled/backbone_form_builder.min.js`
  end
  `yuicompressor -o 'compiled/backbone_form_builder.min.js' 'compiled/backbone_form_builder.js' --type js`
  puts "Compiled 'backbone_form_builder.min.js'"
end

task :install do
  puts `npm install sinon yui3 jsdom underscore jquery expect.js`
  puts `npm install -g mocha coffee-script`
  puts `brew install yuicompressor`
end
