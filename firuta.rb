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

    def filter(proc = nil, params = nil, function: nil, with: [], &block)
      add(
        command: Commands::Filter,
        proc: proc || function || block,
        params: params || with
      )
    end

    def map(proc = nil, params = nil, function: nil, with: [], &block)
      add(
        command: Commands::Map,
        proc: proc || function || block,
        params: params || with
      )
    end

    def sort(proc = nil, params = nil, function: nil, with: [], &block)
      add(
        command: Commands::Sort,
        proc: proc || function || block,
        params: params || with
      )
    end

    def reduce(proc = nil, params = nil, function: nil, with: [], &block)
      add(
        command: Commands::Reduce,
        proc: proc || function || block,
        params: params || with
      )
    end

    def paginate(proc = nil, params = nil, function: nil, with: [], &block)
      add(
        command: Commands::Paginate,
        proc: proc || function || block,
        params: params || with
      )
    end

    def uniq(proc = nil, params = nil, function: nil, with: [], &block)
      add(
        command: Commands::Uniq,
        proc: proc || function || block,
        params: params || with
      )
    end

    def find(proc = nil, params = nil, function: nil, with: [], &block)
      add(
        command: Commands::Find,
        proc: proc || function || block,
        params: params || with
      )
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
