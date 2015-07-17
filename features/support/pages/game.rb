# filename: features/support/pages/game.rb
 
module Pages
  module Game
    class << self

      def next_wave_button
        @next_wave_button = wait { id 'Game Call Next Wave' }
      end
 
      def board
        @board = wait { id 'Game Board' }
      end

      def score_label
        @score_label = wait { id 'Game Score' }
      end

      def score
        self.score_label.value.split(' ').first.to_i
      end

      def swipe_first_row_left
        y = window_size.height-10
        swipe start_x: 100, start_y: y, end_x: 50, end_y: y, duration: 500
      end

      def swipe_second_row_left
        y = window_size.height-10-70
        swipe start_x: 100, start_y: y, end_x: 50, end_y: y, duration: 500
      end

      def enemy(count)
          wait { id 'Enemy'+count.to_s }
      end

      def num_columns
        (window_size.width / 50).to_i
      end

      def enemy_exists (my_id)
        the_size = find_elements(:id, my_id).size
        the_size != 0
      end

      def restart_button
        @restart_button = wait {id 'Game Play Again'}
      end
 
    end
  end
end
 
module Kernel
  def game
    Pages::Game
  end
end
