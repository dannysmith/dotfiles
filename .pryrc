# Hirb
begin
  require 'hirb'
rescue LoadError
  # Missing goodies, bummer
end

if defined? Hirb
  # Slightly dirty hack to fully support in-session Hirb.disable/enable toggling
  Hirb::View.instance_eval do
    def enable_output_method
      @output_method = true
      @old_print = Pry.config.print
      Pry.config.print = proc do |*args|
        Hirb::View.view_or_page_output(args[1]) || @old_print.call(*args)
      end
    end

    def disable_output_method
      Pry.config.print = @old_print
      @output_method = nil
    end
  end

  Hirb.enable
end

# Awesome Print
begin
  require 'ap'
  require 'awesome_print'
  Pry.config.print = proc { |output, value| output.puts value.ai }
rescue LoadError => err
  puts "no awesome_print :("
end


# Aliasses
Pry.commands.alias_command 'q', 'exit'


# Allows the use of the disable-pry command to break out of loopes etc, but doesn;t disable it permanantly.
Pry::Commands.block_command('enable-pry', 'Enable `binding.pry` feature') do
  ENV['DISABLE_PRY'] = nil
end



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
