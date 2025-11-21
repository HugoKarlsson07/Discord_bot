require_relative '../lib/command.rb'

class RollCommand < Command
  def initialize
    super(name: "roll", description: "Roll dice (e.g. !roll d20, !roll 2d6)")
  end

  def execute(event, arg)
    match = arg.match(/^(\d+)?d(\d+)$/i)
    if match
      count = match[1] ? match[1].to_i : 1  # Default 1 om inget nummer
      sides = match[2].to_i
      # count = 2, sides = 6
    end  
    event.execute("🎲 Rullade #{count}d#{sides}: #{results.join(', ')} = **#{total}**")
  end 
end
