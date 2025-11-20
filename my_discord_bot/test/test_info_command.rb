require_relative 'spec_helper'
require_relative '../lib/info_command'

class TestInfoCommand < Minitest::Test
  def test_info_command_has_name_and_description
    command = InfoCommand.new

    assert_equal "!info", command.name
    assert_equal "MinRubyBot v1.0 - En bot byggd med Ruby och TDD!", command.description
  end

  def test_ping_command_responds_with_greeting
    command = InfoCommand.new
    mock_event = MockEvent.new(content:"!info")

    command.execute(mock_event)

    # Kontrollera att bot:en svarade
    assert_equal 1, mock_event.responses.length
    assert_equal "MinRubyBot v1.0 - En bot byggd med Ruby och TDD!", mock_event.responses.first
  end
end