# Hirb
begin
  require 'hirb'
rescue LoadError
  # Missing goodies, bummer
  puts "Couldnt load Hirb. Is it installed?"
end

if defined? Hirb
  # Slightly dirty hack to fully support in-session Hirb.disable/enable toggling
  Hirb::View.instance_eval do
    def enable_output_method
      @output_method = true
      @old_print = Pry.config.print
      Pry.config.print = proc do |output, value|
        Hirb::View.view_or_page_output(value) || @old_print.call(output, value)
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
