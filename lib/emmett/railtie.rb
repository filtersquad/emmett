require 'emmett/configuration'

module Emmett
  class Railtie < ::Rails::Railtie
    R = ::Rails

    config.emmett             = Emmett::Configuration.new
    config.emmett.name        = Rails.root.basename.to_s.titelize
    config.emmett.index_page  = "doc/api.md"
    config.emmett.section_dir = "doc/api"
    config.emmett.output_dir  = "doc/generated-api"
    config.emmett.template    = :default

    rake_tasks do
      require 'emmett/rake_task'
      namespace :doc do
        Emmett::RakeTask.new(:api) { |t| t.configuration = Rails.application.config.emmett }
      end
    end

  end
end