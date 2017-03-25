module RaceBet
  class Race

    class << self
      def score(guesses, winners)
        matches = guesses.zip(winners).first(5).map { |guess, winner| guess == winner }
        points = [15, 10, 5, 3, 1]

        matches.each_with_index.map do |match, index|
          if match
            points[index]
          elsif winners.include? guesses[index]
            points[4]
          else
            0
          end
        end.inject(:+)
      end
    end

  end
end
