require 'rubygems'
require 'irb/completion'

begin
  require 'json'
rescue LoadError => err
  warn "Couldn't load JSON gem: #{err}."
end

begin
  require 'logger'
rescue LoadError => err
  warn "Couldn't load logger gem: #{err}."
end

begin
  require 'nokogiri'
rescue LoadError => err
  warn "Couldn't load Nokogiri: #{err}."
end

# Load Brice (was wirble) (colouring etc in irb)
begin
  require 'brice/init'
rescue LoadError => err
  warn "Couldn't load brice: #{err}."
end

# Load Hirb (pretty formatting in irb)
begin
  require 'hirb'
  Hirb.enable
rescue LoadError => err
  warn "Couldn't load hirb: #{err}."
end

# awesome print
begin
  require 'ap'
  require 'awesome_print'
  AwesomePrint.irb!
rescue LoadError => err
  warn "Couldn't load awesome_print: #{err}."
end

# irb history
IRB.conf[:EVAL_HISTORY] = 1000
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = File::expand_path("~/.irbhistory")

# load .railsrc in rails environments
railsrc_path = File.expand_path('~/.irbrc_rails')
if ( ENV['RAILS_ENV'] || defined? Rails ) && File.exist?( railsrc_path )
  begin
    load railsrc_path
  rescue Exception
    warn "Could not load: #{ railsrc_path } because of #{$!.message}"
  end
end

#Set Log display in script/console
if ENV.include?('RAILS_ENV')&& !Object.const_defined?('RAILS_DEFAULT_LOGGER')
 Object.const_set('RAILS_DEFAULT_LOGGER', Logger.new(STDOUT))
end

# Add Interesting Methods
class Object
  def imethods
    case self.class
    when Class
      ap self.methods.sort - Object.methods
    when Module
      ap self.methods.sort - Module.methods
    else
      ap self.methods.sort - Object.new.methods
    end
  end
end

# Add require_relative and guid
module Kernel
  def require_relative(file)
    $:.unshift Dir.pwd
    require file
  end

  def guid(s)
    s.scan(/[a-f0-9-]{36}/).first
  end
end

#Set up Aliasses
alias q exit

# IRB settings
IRB.conf[:AUTO_INDENT] = true
