class Command
  attr_reader :name, :description
  
  def initialize(name:, description: "NO description")
    @name = name
    @description = description
  end

  def execute(event)
    # Bas-implementation - subklasser kommer override:a denna
    nil
  end

end
