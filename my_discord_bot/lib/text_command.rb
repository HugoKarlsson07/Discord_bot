require_relative '../lib/command.rb'

class TextCommand < Command
  def initialize(name: "test",description: "Test command",text: "Test response")
    super(name: name, description: description)
    @text = text
  end
  attr_reader :text
  
  def execute(event)
    event.respond(@text)
  end
  
end

name = TextCommand.new(name:)
description = TextCommand.new(description:)
text = TextCommand.new(text:)