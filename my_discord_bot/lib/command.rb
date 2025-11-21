class Command
  attr_reader :name, :description
  
  def initialize(name:, description: "NO description")
    @name = name
    @description = description
  end

  def execute(event)
    # Bas-implementation - subklasser kommer override:a denna
    raise NotImplementedError, "Subclass must implement execute method" #NYTT
  end

end
