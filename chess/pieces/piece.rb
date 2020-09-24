require "singleton"
require "colorize"

class Piece
    attr_reader :symbol, :color
    attr_accessor :pos

    def initialize(color, board, pos)
        @color = color
        @board = board 
        @pos = pos
    end

    def to_s
        @symbol.to_s
    end 

    def valid_moves?
    end 

    
    
end 


class NullPiece < Piece
    include Singleton
    attr_reader :symbol, :color
    def initialize
        @symbol = " "
        @color = :TBD
    end 

    def moves
        []
    end
end 

module Slideable

    def orthogonal_dirs
        ORTHOGONAL_DIRS
    end 

    def diagonal_dirs
        DIAGONAL_DIRS
    end 
    
    def moves 
        all_moves= []
        move_dirs.each do |coord|
            dx,dy = coord
            all_moves += grow_unblocked_moves_in_dir(dx,dy)
        end 
        all_moves
    end 

    private
    ORTHOGONAL_DIRS = [
        [-1,0],
        [1,0],
        [0,1],
        [0,-1]
    ]

    DIAGONAL_DIRS = [
        [-1,-1],
        [-1,1],
        [1,-1],
        [1,1]
    ]

    private 
    def move_dirs
        #return right ones for class
        raise NotImplementedError
    end 
         
    def grow_unblocked_moves_in_dir(dx,dy)
        moves= []
        cx, cy = self.pos
        loop do 
            cx += dx
            cy += dy
            new_pos = [cx, cy]
            break if !@board.valid_pos?(new_pos) || @board[new_pos].color == color
            
            if @board[new_pos].is_a?(NullPiece)
                moves << new_pos
            elsif @board[new_pos].color != color
                moves << new_pos
                break
            end
        end 
        moves
    end 

end

module Stepable
    def moves
        all_moves= []
        cx, cy = self.pos
        move_diffs.each do |dx, dy|
            new_pos = [(cx+dx), (cy+dy)]
            next if !@board.valid_pos?(new_pos) && @board[new_pos].color == color
            
            if @board[new_pos].is_a?(NullPiece) || @board[new_pos].color != color
                all_moves << new_pos
            end 
        end
        all_moves
    end

    private
    def move_diffs
        raise NotImplementedError
    end 
end 





