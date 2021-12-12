module Sudoku
  class ScopeForUniqueness
    attr_reader :cells

    def initialize cells
      @cells = cells
    end

    def complete?
      missing.empty?
    end

    def contains? number
      cells.any? number
    end

    def missing
      @missing ||= begin
                     matching = ALL_NUMBERS.dup
                     cells.each do |cell|
                       next if cell.empty?

                       matching.delete cell.value
                     end
                     matching
                   end
    end

    def present
      @present ||= ALL_NUMBERS - missing
    end

    def refresh_cache!
      @missing, @present = nil, nil
      present
      missing
      true
    end
  end
end
