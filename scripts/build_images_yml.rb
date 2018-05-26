#!/usr/bin/env ruby
require 'yaml'
require 'pp'

file_type = ".png"
projects = {}
Dir.glob("#{__dir__}/../assets/images/*/*#{file_type}").each do |file|
  relative_path = file.split("../")[1]
  project_name = File.basename(File.dirname(relative_path))
  file_name = File.basename(file).sub(file_type, '')

  projects[project_name] = [] if not projects.key?(project_name)
  projects[project_name] << {"src" => relative_path, "alt" => file_name}
end

pp projects
puts projects.to_yaml
