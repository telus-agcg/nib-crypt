require 'nib/crypt/version'
require 'nib/crypt/initializer'
require 'nib/crypt/key'

module Nib
  module Crypt
    DEFAULT_KEY_NAME = 'secrets.aes'.freeze

    module_function

    def init
      Initializer.new.call
    end

    def encrypt(input, output)
      exec(script(input, output, 'e'))
    end

    def decrypt(input, output)
      exec(script(input, output, 'd'))
    end

    def script(input, output, direction)
      <<-"SCRIPT"
        openssl enc \
          -in #{input} \
          -out #{output} \
          -#{direction} \
          -md md5 \
          -aes256 \
          -pass file:#{DEFAULT_KEY_NAME}
      SCRIPT
    end
  end
end
