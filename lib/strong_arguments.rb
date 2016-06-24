require "strong_arguments/version"

class StrongArguments

  def initialize(arguments)
    @arguments = arguments
  end

  # possible to implement optionals with default values as
  #   name: default_value
  def optional(*options)
    @optional = options
    self
  end

  def only_one_allowed
    raise ArgumentError.new('Only one argument allowed') if arguments.length > 1
    self
  end

  def at_least_one_required
    raise ArgumentError.new('At least one argument required') if arguments.length < 1
    self
  end

  def method_missing(method_sym, *args, &block)
    key = method_sym.to_s.gsub('_present?', '').to_sym
    no_args_and_block = args.empty? && block.nil?

    if allowed_keys.include?(method_sym) && no_args_and_block
      check_for_allowed_keys

      arguments.fetch(method_sym)
    elsif method_sym.to_s =~ /_present\?$/ && allowed_keys.include?(key) && no_args_and_block
      check_for_allowed_keys

      arguments.key?(key)
    else
      super
    end
  end

  private

    attr_reader :arguments

    def allowed_keys
      @optional # + required
    end

    def not_allowed_keys
      @not_allowed_keys ||= arguments.keys - allowed_keys
    end

    def contains_only_allowed_keys?
      not_allowed_keys.length == 0
    end

    def check_for_allowed_keys
      raise ArgumentError.new("Prohibited keys: #{not_allowed_keys.join(', ')}") unless contains_only_allowed_keys?
    end
end
