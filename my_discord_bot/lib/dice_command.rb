class DiceCommand
  
  attr_reader :content
  def initialize(content: "!dice")
    @content = content
  end

  def execute(event)
    dice = rand(1..6).to_i
    event.respond("Du rullade #{dice}")
  end
end