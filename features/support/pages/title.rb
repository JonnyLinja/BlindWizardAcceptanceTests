# filename: features/support/pages/title.rb
 
module Pages
  module Title
    class << self
 
      def play_button
        @play_button = wait { id 'Play Button' }
      end

      def leaderboard_button
        @leaderboard_button = wait { id 'Leaderboard Button' }
      end
 
    end
  end
end
 
module Kernel
  def title
    Pages::Title
  end
end

