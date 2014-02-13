require "coupe/builder"
require "coupe/version"

module Coupe
  def self.generate(options = {})
    Coupe::Builder.new(options).generate
  end
end
