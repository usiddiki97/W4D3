require_relative "piece"
require "byebug"


class Pawn < Piece

    def symbol
        '♙'#.colorize(color)
    end

    def move
        forward_steps + side_attacks
    end

    private

    def at_start_row?
        pos[0] == (color == :white) ? 6 : 1
    end 

    def forward_dir
        color == :white ? -1 : 1
    end

    def forward_steps
        all_moves = []

        cx, cy = self.pos
        return [] if !@board[[cx + forward_dir, cy]].is_a?(NullPiece)

        all_moves << [(cx + (2 * forward_dir)), cy] if at_start_row?
        all_moves << [(cx + forward_dir), cy]

        all_moves.select {|pos| @board.valid_pos?(pos)}
    end

    def side_attacks 
        cx , cy = self.pos 
        diag = [[cx + forward_dir, cy - 1], [cx + forward_dir, cy + 1]]

        diag.select do |new_pos|
            @board.valid_pos?(new_pos) && @board[new_pos].color != self.color && !@board[new_pos].is_a?(NullPiece)
        end
    end    

end


