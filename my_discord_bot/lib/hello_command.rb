class HelloCommand
  
  attr_reader :name, :description
  
  def initialize(name:"hej", description: "NO description")
    @name = name
    @description = description
  end

  def execute(event)
    event.respond("Hello!")
  end

end
