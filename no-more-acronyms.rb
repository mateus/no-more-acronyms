require 'bundler/inline'
require 'yaml'

gemfile do
  source 'https://rubygems.org'
  gem 'nokogiri'
end

class NoMoreAcronyms
  def initialize(path)
    dict = YAML.load_file(path)
    builder = build_plist(dict)
    output_path = "results/#{File.basename(path, ".yml")}.plist"
    create_result_file(builder, output_path)
  end

  private  

  def build_plist(acronyms)
    Nokogiri::XML::Builder.new do |xml|
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
  end

  def create_result_file(builder, file_path)
    File.open(file_path, "w+") { |file| file.write(builder.to_xml) }
    puts "#{file_path} CREATED"
  end
end

ARGV.each do |path| 
  NoMoreAcronyms.new(path)
end

puts
puts 'Drag created files to Settings > Keyboard > Text configuration window' if ARGV.length > 0
