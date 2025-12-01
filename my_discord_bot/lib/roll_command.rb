require_relative '../lib/command.rb'

class RollCommand < Command
  def initialize
    super(name: "roll", description: "Roll dice (e.g. !roll d20, !roll 2d6)")
  end

  def execute(event, arg)
    if arg != []
      match = arg[0].match(/^(\d+)?d(\d+)$/i)
      if match
        count = match[1] ? match[1].to_i : 1
        sides = match[2] ? match[2].to_i : 6
      end
    else
      count = 1
      sides = 6
    end

    results = roll(sides, count)
    p results
    event.respond("🎲 Rullade #{count}d#{sides}: #{results.join(',')} = **#{results.sum}**")
  end 

  private
  def roll(sides, count)
    (1..count).map {|c| rand(1..sides)}
  end

end
