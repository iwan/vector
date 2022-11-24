# frozen_string_literal: true

require_relative "vector/version"
require_relative "vector/vector"

module Vector
  class DifferentSizeError < StandardError; end
  # Your code goes here...
end

include Vector