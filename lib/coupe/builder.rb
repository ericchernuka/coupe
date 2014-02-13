require 'securerandom'

module Coupe
  class Builder
    def initialize(options)
      @parts          = options.delete(:parts) || 3
      @part_length    = options.delete(:part_length) || 4
      # @plaintext      = options.delete(:plaintext) || random_plaintext
      @symbol_string  = '0123456789ABCDEFGHJKLMNPQRTUVWXY'
      @symbol_array   = @symbol_string.split('')
      @symbols        = {}
      @code           = []

      @symbol_array.each_with_index { |key, index| @symbols[key] = index }

      validates_minimum_parts
      validates_minimum_part_length
    end

    def generate
      # @sha1_hash = Digest::SHA256.digest(random_plaintext)
      # bytes = @sha1_hash.split("").map { |char| char.ord & 31 }


      (1..@parts).each do |i|
        part = ""
        (1..(@part_length - 1)).each do |j|
          part << random_symbol
        end
        part = part + check_digit_algorithm(part, i + 1)
        @code.push(part)
      end
      @code.join('-')
    end

    def random_hash

    end

    private

    def check_digit_algorithm(data, check)
      data.split("").each do |value|
        k = @symbols[value]
        check = check * 19 + k
      end
      return @symbol_array[check % 31]
    end

    def random_symbol
      @symbol_array[(SecureRandom.random_number * @symbol_array.size).to_i]
    end

    def random_plaintext
      (Process.pid + Time.now.to_i + SecureRandom.random_number).to_s
    end

    def validates_minimum_parts
      raise(ArgumentError, ":parts length must be at least 3 characters") if @parts < 3
    end

    def validates_minimum_part_length
      raise(ArgumentError, ":part_length must be at least 4 characters") if @part_length < 4
    end

    # def default_bad_word_list
    #   %w(SHPX PHAG JNAX JNAT CVFF PBPX FUVG GJNG GVGF SNEG URYY ZHSS QVPX XABO NEFR FUNT GBFF FYHG GHEQ FYNT PENC CBBC OHGG SRPX OBBO WVFZ WVMM CUNG )
    # end
  end
end