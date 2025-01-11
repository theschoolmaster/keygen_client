# frozen_string_literal: true

require 'httparty'
require 'json'
require 'logger'
require_relative "keygen_client/version"
require_relative "./json_formatter"
require_relative "keygen_client/actions/license"
require_relative "keygen_client/actions/policy"
require_relative "keygen_client/actions/machine"
require_relative "keygen_client/actions/user"

# include our custom formatter with pretty json
HTTParty::Logger.add_formatter('json', HTTParty::Logger::JsonFormatter)

module Keygen
  class Error < StandardError; end
  # Your code goes here...

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    config = configuration
    yield(config)
  end

  class Configuration
    attr_accessor :token
    attr_accessor :account

    def initialize
      @token   = ENV['KEYGEN_TOKEN']
      @account = ENV['KEYGEN_ACCOUNT']
    end
  end

  class Client
    include HTTParty
    include Actions::License
    include Actions::Policy
    include Actions::Machine
    include Actions::User


    #logger ::Logger.new('log/keygen_api.log'), :debug, :json

    def initialize
      # production URI
      self.class.base_uri "https://api.keygen.sh/v1/accounts/#{Keygen.configuration.account}"

      @headers = {
        'Authorization' => "Bearer #{Keygen.configuration.token}",
        'Content-Type' => 'application/json',
        'Accept' => 'application/json',
        #'Keygen-Environment' => 'production'
      }
    end

    private

    def parse_response(response)
      parsed = response.parsed_response
      if response.success?
        parsed
      else
        { error: parsed }
      end
    end
  end

end
