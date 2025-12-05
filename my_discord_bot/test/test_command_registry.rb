require_relative 'spec_helper'
require_relative '../lib/command_registry'
require_relative '../lib/text_command'
require_relative '../lib/command'

class TestCommandRegistry < Minitest::Test
  def test_registry_can_be_created
    registry = CommandRegistry.new

    assert_instance_of CommandRegistry, registry
  end

  def test_can_register_command
    registry = CommandRegistry.new
    command = TextCommand.new(name: "hello", description: "Says hello", text: "Hello!")

    registry.register(command)

    # Verifiera att kommandot registrerades (vi testar detta via find i nästa test)
    # För nu, bara att det inte kraschar
    assert true
  end
  def test_can_find_registered_command
    registry = CommandRegistry.new
    command = TextCommand.new(name: "!hello", description: "Says hello", text: "Hello!")
    registry.register(command)

    found = registry.find("!hello")

    assert_equal command, found
  end
  def test_can_find_find_nil_command
    registry = CommandRegistry.new
    command = TextCommand.new(name: "!prut", description: "...", text: "...")
    registry.register(command)

    found = registry.find("!okänd")

    assert_equal nil, found
  end
  def test_can_list_all_commands
    registry = CommandRegistry.new
    hello = TextCommand.new(name: "hello", description: "Says hello", text: "Hello!")
    ping = TextCommand.new(name: "ping", description: "Pings", text: "Pong!")

    registry.register(hello)
    registry.register(ping)

    commands = registry.all

    assert_equal 2, commands.length
    assert_includes commands.values, hello
    assert_includes commands.values, ping
  end
  def test_find_is_case_insensitive_and_flexible
    registry = CommandRegistry.new
    command = TextCommand.new(name: "hello", description: "Says hello", text: "Hello!")
    registry.register(command)

    # Olika varianter ska alla hitta samma kommando
    assert_equal command, registry.find("!hello")
    assert_equal command, registry.find("!HELLO")
    assert_equal command, registry.find("  !Hello  ")
  end
end