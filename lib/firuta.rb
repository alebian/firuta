require_relative 'firuta/commands/filter'
require_relative 'firuta/commands/map'
require_relative 'firuta/commands/sort'
require_relative 'firuta/commands/reduce'
require_relative 'firuta/commands/paginate'
require_relative 'firuta/commands/uniq'
require_relative 'firuta/commands/find'
require_relative 'firuta/errors/more_than_one_terminal_command'

module Firuta
  def self.new(collection = nil)
    Base.new(collection)
  end

  class Base
    def initialize(collection = nil)
      @steps = [[]]
      @collection = collection
      @terminal_command_added = false
    end

    COMMANDS = [
      [:filter,   Commands::Filter],
      [:sort,     Commands::Sort],
      [:reduce,   Commands::Reduce],
      [:paginate, Commands::Paginate],
      [:uniq,     Commands::Uniq],
      [:find,     Commands::Find]
    ].freeze

    COMMANDS.each do |array|
      define_method(array[0]) do |func = nil, params = nil, function: nil, with: [], &block|
        add(
          command: array[1],
          func: func || function || block,
          params: params || with
        )
        self
      end
    end

    def map(func = nil, params = nil, function: nil, with: [], &block)
      add(command: Commands::Map, func: func || function || block, params: params || with)
      @steps << []
      self
    end

    def apply(collection = nil)
      result = collection || @collection
      @steps.each do |commands|
        break if commands.empty?
        commands.each do |command|
          result = command.apply_to(result)
        end
      end
      result
    end

    private

    def add(command:, func:, params:)
      raise Errors::MoreThanOneTerminalCommand if @terminal_command_added
      @steps.last << command.new(func, params)
      @terminal_command_added = true if command.terminal?
      self
    end
  end
end
