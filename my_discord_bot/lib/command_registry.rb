



class CommandRegistry
  attr_accessor  :commands
  def initialize
    command = @command
  end

  def register(command)
    @commands ||= {}
    @commands[command.name] = command
  end

  def find(command_name)
    
  end
end
