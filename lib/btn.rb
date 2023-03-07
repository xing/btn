# frozen_string_literal: true

require_relative "btn/version"

require "optparse"

# BTN - Main Module
#
# Main entry point for the BTN Gem. We are using OptionParser
# in order to collect command line arguments required to send a teams
# notification.
# Will automatically print a help screen, if arguments are omitted.
# Intendend for use on Bitrise. Depends on Bitrise ENV variables
module Btn
  class Error < StandardError; end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def self.send_notification
    options = {
      title: ENV.fetch("BITRISEIO_PIPELINE_TITLE", "BITRISE_TRIGGERED_WORKFLOW_TITLE"),
      status: ENV.fetch("BITRISE_BUILD_STATUS"),
      build_url: ENV.fetch("BITRISE_BUILD_URL")
    }

    parser = OptionParser.new do |opts|
      opts.banner = "Usage: btn [options]"

      opts.on("-t", "--text TEXT", "Text to be included in the message") do |option|
        options[:body] = option.downcase
      end
      opts.on("-m", "--ms-teams-webhook WEBHOOK_URL", "Webhook URL of the MS TEAMS channel to post to") do |option|
        options[:webhook_url] = option.downcase
        abort("You need to specify a valid MS Teams webhook url") if options[:webhook_ulr].nil?
      end
      opts.on("-h", "--help", "Display options") do
        puts opts
        exit
      end
    end

    parser.parse!

    execute(options)
  end
  # rubocop:enable Metrics/MethodLength
  # rubocop:enable Metrics/AbcSize

  def self.execute(options)
    puts options.inspect
  end
end
