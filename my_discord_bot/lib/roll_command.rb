require_relative '../lib/command.rb'

class RollCommand < Command
  def initialize
    super(name: "roll", description: "Roll dice (e.g. !roll d20, !roll 2d6)")
  end

  def execute(event, arg)
    match = arg.match(/^(\d+)?d(\d+)$/i)
    if match
      count = match[1] ? match[1].to_i : 1
      sides = match[2].to_i

      total = 0
      results = []
      coun  t.times do
        rull += rand(1..sides)
        results << roll
        total += rull
      end
    event.execute("🎲 Rullade #{count}d#{sides}: #{results.join(', ')} = **#{total}**")
    end
  end 
end
