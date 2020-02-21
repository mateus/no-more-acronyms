require 'bundler/inline'
require 'yaml'

gemfile do
  source 'https://rubygems.org'
  gem 'nokogiri'
end

def create_plist(path)
  begin
    acronyms = YAML.load_file(path)
    
    builder = Nokogiri::XML::Builder.new do |xml|
      xml.doc.create_internal_subset(
        'plist',
        "-//Apple//DTD PLIST 1.0//EN",
        "http://www.apple.com/DTDs/PropertyList-1.0.dtd"
      )
      xml.plist('version' =>  '1.0') {
        xml.array {
          eval(acronyms.inspect)[0].each do |acronym, value|
            xml.dict {
              xml.key 'phrase'
              xml.string value
              xml.key 'shortcut'
              xml.string acronym
            } 
          end
        }
      }
    end

    File.open("Text Substitutions.plist", "w+") { |file| file.write(builder.to_xml) }

    puts
    puts '/============ Text Substitutions.plist ============\\'
    puts builder.to_xml
    puts '\============ Text Substitutions.plist ============/'
  rescue SyntaxError => e
    puts e
  end
end

create_plist(ARGV[0] || 'acronyms.yml')
