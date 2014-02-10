require 'rubygems'
require 'logger'
require "json"
require "nokogiri"

#Load Wribble (colouring etc in irb)
begin
  require 'wirble'

  Wirble.init
  Wirble.colorize
rescue LoadError => err
  warn "Couldn't load wirble: #{err}"
end

#Load Hirb (pretty formatting in irb)
begin
  require 'hirb'
  Hirb.enable
rescue LoadError => err
  warn "Couldn't load hirb: #{err}"
end

#Set Log display in script/console
if ENV.include?('RAILS_ENV')&& !Object.const_defined?('RAILS_DEFAULT_LOGGER')
 Object.const_set('RAILS_DEFAULT_LOGGER', Logger.new(STDOUT))
end


#Set up Aliasses
alias q exit

IRB.conf[:AUTO_INDENT]=true