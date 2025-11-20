class InfoCommand
  
  attr_reader :name, :description
  def initialize(name: "!info", description: "MinRubyBot v1.0 - En bot byggd med Ruby och TDD!")
    @name = name
    @description = description
  end

  def execute(event)
    event.respond("MinRubyBot v1.0 - En bot byggd med Ruby och TDD!")
  end

end
