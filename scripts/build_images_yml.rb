#!/usr/bin/env ruby
require 'yaml'
require 'pp'

file_type = ".png"
projects = {}
data = {"path" => "assets/images/"}
Dir.glob("#{__dir__}/../assets/images/*/*#{file_type}").each do |file|
  relative_path = file.split("../")[1]
  project_name = File.basename(File.dirname(relative_path))
  file_name = File.basename(file).sub(file_type, '')

  projects[project_name] = {} if not projects.key?(project_name)
  projects[project_name][file_name] = ["src" => relative_path, "alt" => file_name]
end

data["projects"] = projects
# pp data
puts data.to_yaml
