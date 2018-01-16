
module Nib
  module Crypt
    class Initializer
      attr_reader :key

      def initialize
        @key = Key.new
      end

      # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
      def call
        if key.remote? && !key.local?
          puts 'Pulling existing key from S3'
          key.pull
        elsif !key.local?
          puts 'Key does not yet exist, creating'
          key.create!
          puts 'Pushing new key to to S3'
          key.push
        elsif !key.remote?
          puts 'Pushing existing key to to S3'
          key.push
        else
          puts 'Project already inialized'
        end
      end
      # rubocop:enable Metrics/MethodLength, Metrics/AbcSize
    end
  end
end
