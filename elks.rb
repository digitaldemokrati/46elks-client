# encoding: utf-8

require 'rubygems'
require 'restclient'

class Elks
  class << self
    
    SENDER = "TheSender" # This can be max 11 characters, and only A-Z, a-z, and 0-9.

    @@username, @@password = open('./sms-credentials.txt').read.split("\n")
    @@baseurl  = "https://#{@@username}:#{@@password}@api.46elks.com/a1/"

    def sms number, message
      RestClient.post "#{@@baseurl}SMS", { :from => SENDER, :to => number, :message => message }
    end
    
  end
end