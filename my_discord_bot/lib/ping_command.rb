class PingCommand
  
  attr_reader :name, :description
  def initialize(name: "!ping", description: "Pong!")
    @name = name
    @description = description
  end

  def execute(event)
    event.respond("Pong!")
  end

end
