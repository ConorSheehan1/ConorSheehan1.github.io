#!/usr/bin/env ruby
# frozen_string_literal: true

require 'yaml'
require 'pp'

def image_dir_to_yml(root_dir, glob_path, ext)
  yml = {}
  Dir.glob("#{root_dir}/#{glob_path}#{ext}").each do |file|
    relative_path = file.gsub(root_dir, '')
    project_name = File.basename(File.dirname(relative_path))
    file_name = File.basename(file).sub(ext, '')

    # if the project entry doesn't exist yet, create it
    yml[project_name] = [] unless yml.key?(project_name)
    # add the src and alt of the image to the project
    yml[project_name] << { 'src' => relative_path, 'alt' => file_name }
  end
  yml
end

projects = image_dir_to_yml(File.dirname(__dir__), 'assets/images/*/*', '.png')

pp projects
puts projects.to_yaml
