require "debug"

class CommandRegistry
  attr_accessor  :commands
  def initialize 
    @commands = {} #alla komandon
  end

  def register(command)
 
    @commands[command.name] = command
  end

  def find(command_name)
    #binding.break
    @commands[command_name]
  end

  def all
    @commands
  end

  private
    def normalize_name(name)
      @name = name.strip.downcase
    end
end
