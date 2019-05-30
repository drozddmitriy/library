class Myvalid < StandardError
end

# class MyCustomException < StandardError
#   def initialize(msg="This is a custom exception", exception_type="custom")
#     @exception_type = exception_type
#     super(msg)
#   end
# end

# begin
#     raise MyCustomException.new "Message, message, message", "Yup"
# rescue MyCustomException => e
#     puts e.message *# Message, message, message*
#     puts e.exception_type *# Yup*
# end
