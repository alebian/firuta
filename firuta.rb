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
      @commands = []
      @collection = collection
      @terminal_command_added = false
    end

    COMMANDS = [
      [:filter,   Commands::Filter],
      [:map,      Commands::Map],
      [:sort,     Commands::Sort],
      [:reduce,   Commands::Reduce],
      [:paginate, Commands::Paginate],
      [:uniq,     Commands::Uniq],
      [:find,     Commands::Find]
    ].freeze

    COMMANDS.each do |array|
      define_method(array[0]) do |proc = nil, params = nil, function: nil, with: [], &block|
        add(
          command: array[1],
          proc: proc || function || block,
          params: params || with
        )
      end
    end

    def apply(collection = nil)
      result = collection || @collection
      @commands.each do |command|
        result = command.apply_to(result)
      end
      result
    end

    private

    def add(command:, proc:, params:)
      raise Errors::MoreThanOneTerminalCommand if @terminal_command_added
      @commands << command.new(proc, params)
      @terminal_command_added = true if command.terminal?
      self
    end
  end
end
