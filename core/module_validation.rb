module ValidationEntity
  def empty?(*args)
    raise BookValidation, 'Error argument is empty' if args.any?(&:empty?)
  end

  def instance?(instance, *args)
    args.each { |object| raise BookValidation, 'Error instance!' unless object.is_a?(instance) }
  end
end
