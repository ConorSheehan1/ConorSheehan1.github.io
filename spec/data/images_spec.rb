# frozen_string_literal: true

# TODO: load data from jekyll site.data rather than using yaml directly
describe 'images data file', type: :data do
  context 'when the data is loaded' do
    # Dir.pwd will be root of this project since rspec must be run from root
    YAML.load_file("#{Dir.pwd}/_data/images.yml").each do |project, images|
      context project do
        it 'should have valid image paths' do
          images.each do |image|
            src = image['src']
            expect(File.exist?(src)).to be true
          end
        end
        it 'each image should have an alt' do
          images.each do |image|
            expect(image['alt'].nil?).to be false
          end
        end
      end
    end
  end
end
