# frozen_string_literal: true

require_relative "btn/version"

module Btn
  class Error < StandardError; end

  def self.send_notification
    puts "This is a teams notification"
  end
end
