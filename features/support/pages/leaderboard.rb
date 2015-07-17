# filename: features/support/pages/leaderboard.rb
 
module Pages
  module Leaderboard
    class << self
 
      def score_label
        @score_label = wait { id 'Leaderboard Scores' }
      end

      def num_scores
        self.score_label.value.split("\n\n").length
      end

    end
  end
end
 
module Kernel
  def leaderboard
    Pages::Leaderboard
  end
end

