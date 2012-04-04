# Most of all of this code from @ai (Andrey Sitnik) one-page site engine
# https://github.com/ai/easings.net

require 'rubygems'
require 'pathname'
require 'rake'
require 'bundler'
require 'uglifier'
require 'sprockets'
require 'haml'

require 'compass'

ROOT = Pathname(__FILE__).dirname
COMPILED_PATHS = {
                   # TODO: Here we need configurable params
                   :img => ROOT.join('images/'),
                   :js => ROOT.join('javascripts/'),
                   :html => ROOT,
                   :css => ROOT.join('stylesheets/')
                 }

ASSETS_ROOT = ROOT.join('assets/')
TEMPLATE_PATHS = {
                   :coffee => ASSETS_ROOT.join('coffee/'),
                   :templates => ASSETS_ROOT.join('templates/'),
                   :layout => ASSETS_ROOT.join('templates/layout/'),
                   :sass => ASSETS_ROOT.join('sass/'),
                   :images => ASSETS_ROOT.join('images/')
                 }

Compass.configuration.images_path = TEMPLATE_PATHS[:images].to_s

class Pathname
  def glob(pattern, &block)
    Pathname.glob(self.join(pattern), &block)
  end
end

class Helper

  attr_accessor :path

  def initialize(env)
    @env = env
  end

  def assets
    @sprockets ||= begin
      Sprockets::Environment.new(ROOT) do |env|
        TEMPLATE_PATHS.values.each { |it| env.append_path it }

        compass = Gem.loaded_specs['compass'].full_gem_path
        env.append_path("#{compass}/frameworks/compass/stylesheets")

        if @env == :production
          env.js_compressor = Uglifier.new(copyright: false)
        end
      end
    end
  end

  def render(haml, &block)
    options = { format: :html5 }
    options[:ugly] = true if @env == :production
    Haml::Engine.new(haml, options).render(self, &block)
  end

  def production?
    @env == :production
  end

end

environment = nil

desc 'Build all assets'
task :build do |t, args|
  environment ||= :production

  puts 'build'

  layout = TEMPLATE_PATHS[:layout].join('layout.html.haml').read

  helper = Helper.new environment

  TEMPLATE_PATHS[:templates].glob('**/*.html.haml') do |template|
    next if template.basename.to_s == 'layout.html.haml'

    path = template.
      relative_path_from(TEMPLATE_PATHS[:templates]).
      sub_ext('').sub_ext('').to_s
    file = ROOT.join(path + ".html")

    helper.path = path

    file.open('w') do |html|
      html << helper.render(layout) { helper.render(template.read) }
    end

    `gzip --best -c #{file} > #{file}.gz` if helper.production?

    print '.'
  end

  print "\n"
end

desc 'Rebuild files on every changes'
task :watch do
  environment ||= :development
  Rake::Task['build'].execute

  def rebuild
    print 're'
    Rake::Task['build'].execute
  rescue Exception => e
    puts
    puts "ERROR: #{e.message}"
  end

  require 'fssm'
  FSSM.monitor(ASSETS_ROOT, '**/*') do
    update { rebuild }
    delete { rebuild }
    create { rebuild }
  end
end

### Rake tasks ###

desc 'Run all tests by default'
task :default do
  system("rspec spec")
end

