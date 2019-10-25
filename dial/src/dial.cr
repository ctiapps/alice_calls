require "asterisk/ari"
require "uuid"

# TODO: Write documentation for `Dial`
module Dial
  extend self

  VERSION = {{ `shards version #{__DIR__}`.chomp.stringify }}

  @@ari : Asterisk::ARI? = nil

  def ari
    return @@ari.as(Asterisk::ARI) unless @@ari.nil?

    credentials = {
      url:      %(http://#{ENV.fetch("ASTERISK_HOST", "asterisk")}:#{ENV.fetch("ASTERISK_HTTP_PORT", "8088")}/ari),
      app:      ENV.fetch("ASTERISK_ARI_APPNAME",  "asterisk.cr"),
      username: ENV.fetch("ASTERISK_ARI_USERNAME", "asterisk.cr"),
      password: ENV.fetch("ASTERISK_ARI_PASSWORD", "asterisk.cr")
    }

    @@ari = Asterisk::ARI.new(**credentials).not_nil!
  end

  # TODO: Put your code here
  def start
    puts "Started, yeah!"
    ari.start
    sleep 30
    puts "Bye!"
  end
end
