module Tonic
  module Template
    class << self

      def create(name = "")
        if name.empty?
          copy_template
        else
          sh "mkdir #{name}"
          copy_template(name)
        end

        log_files
        bundle_install(name)
      end

      protected

      def copy_template(new_path = "")
        path =  File.expand_path('../../template', __FILE__)
        puts path
        sh "cp -r #{path}/(.*|*) ./#{new_path}"
      end

      private

      def sh(*command)
        Tonic::Shell.run(*command)
      end

      def log_files
        puts 'Created files:'
        Dir[File.expand_path '../template/**/*', __FILE__].each {|it| puts it }
      end

      def bundle_install(name = "")
        puts 'Running bundle install'
        sh "cd ./#{name}"
        sh "bundle install"
      end

    end
  end
end
