require 'refinerycms-core'

module Refinery
  autoload :CareHomesGenerator, 'generators/refinery/care_homes_generator'

  module CareHomes
    require 'refinery/care_homes/engine'

    class << self
      attr_writer :root

      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end

      def factory_paths
        @factory_paths ||= [ root.join('spec', 'factories').to_s ]
      end
    end
  end
end
