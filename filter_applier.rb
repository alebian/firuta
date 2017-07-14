class FilterApplier
  attr_reader :filters

  VALID_TYPES = %i[conjunction disjunction]

  def initialize(exclusive_operation = nil)
    if exclusive_operation
      validate_type!(exclusive_operation)
      @exclusive_operation = exclusive_operation
    end

    @filters = {
      conjunction: { reducer: :&, procs: [] },
      disjunction: { reducer: :|, procs: []  }
    }
  end

  def self.add(*params)
    self.new.add(*params)
  end

  def add(filter:, params: [], type: :conjunction)
    validate_type!(type)
    type_to_use = @exclusive_operation || type

    @filters[type_to_use][:procs] << { proc: filter, proc_params: params }
    self
  end

  def filter(collection, type = :conjunction)
    validate_type!(type)
    type_to_use = @exclusive_operation || type

    collection.select do |element|
      @filters[type_to_use][:procs]
        .map { |filter| filter[:proc].call(element, *filter[:proc_params]) }
        .reduce(@filters[type_to_use][:reducer])
    end
  end

  private

  def validate_type!(type)
    raise ArgumentError, "Invalid operation type #{type}" unless type && VALID_TYPES.include?(type)
  end
end
