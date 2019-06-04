class Validation < StandardError
end

def empty?(*args)
  raise Validation, 'Error argument is empty' if args.any?(&:empty?)
end

def instance?(instance, *args)
  args.each { |object| raise Validation, 'Error instance!' unless object.is_a?(instance) }
end
