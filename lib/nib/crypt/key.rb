module Nib
  module Crypt
    class Key
      def create!
        `openssl rand -out #{name} -hex 512`
      end

      def local?
        @local ||= File.exist?(name)
      end

      def remote?
        @remote ||= !`aws s3 ls s3://#{bucket}/${PWD##*/}.#{name}`.empty?
      end

      def push
        `aws s3 cp #{name} s3://#{bucket}/${PWD##*/}.#{name}`
      end

      def pull
        `aws s3 cp s3://#{bucket}/${PWD##*/}.#{name} #{name}`
      end

      private

      def name
        DEFAULT_KEY_NAME
      end

      def bucket
        ENV.fetch('NIB_CRYPT_BUCKET_NAME') { raise MissingBucketError }
      end

      class MissingBucketError < StandardError
        def message
          <<-ERROR.tr("\n", '').gsub(/\s+/, ' ')
            Please provide a bucket via the `NIB_CRYPT_BUCKET_NAME`
            environment variable
          ERROR
        end
      end
    end
  end
end
