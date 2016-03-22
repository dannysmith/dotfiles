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


# Add Interesting Methods method.
class Object
  def imethods
    puts self.class
    if self.class.to_s == "Module"
      puts "I'm a Module"
      self.methods false
    elsif self.class.to_s == "Class"
      puts "I'm a Class"
      self.methods false
    else
      puts "I'm a Object"
      self.public_methods false
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
