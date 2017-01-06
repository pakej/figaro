require "figaro/error"
require "figaro/env"
require "figaro/application"
require "figaro/configuration"

module Figaro
  extend self

  attr_writer :adapter, :application

  def env
    Figaro::ENV
  end

  def adapter
    @adapter ||= Figaro::Application
  end

  def application
    @application ||= adapter.new
  end

  def load
    application.load
  end

  def require_keys(*keys)
    missing_keys = keys.flatten - ::ENV.keys
    raise MissingKeys.new(missing_keys) if missing_keys.any?
  end

  def self.config
    Figaro::Configuration
  end

  def self.configure
    yield Figaro::Configuration
  end  
end

require "figaro/rails"
