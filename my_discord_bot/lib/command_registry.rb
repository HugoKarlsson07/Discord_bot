require "debug"

class CommandRegistry
  attr_accessor  :commands
  def initialize 
    @commands = {}
  end

  def register(command)
 
    @commands[command.name] = command
  end

  def find(command_name)
    #binding.break
    @commands[command_name.to_s]
  end
end
