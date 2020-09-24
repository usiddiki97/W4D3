require_relative "pieces.rb"
require "byebug"

# Phase I: Board
class Board
    attr_reader :grid
    
    def build_grid
        grid = Array.new(8) { Array.new(8, NullPiece.instance) } 

        (0...8).each do |i|
            grid[1][i]= Pawn.new(:black, self, [1,i]) 
            grid[6][i]= Pawn.new(:white, self, [6,i])
        end

        pieces = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]
        pieces.each_with_index do |piece, y|
            grid[0][y] = (piece.new(:black, self, [0,y]))
            grid[7][y] = (piece.new(:white, self, [7,y]))
        end 
        grid
    end
    
    
    def initialize(grid= build_grid)
        @sentinel = NullPiece.instance
        @grid = grid
    end
    
    def [](pos)
        raise "invalid position" unless valid_pos?(pos)
        row, col = pos
        @grid[row][col]
    end
    
    def []=(pos, val)
        raise "invalid position" unless valid_pos?(pos)
        row, col = pos
        @grid[row][col] = val
    end
    
    def move_piece(start_pos, end_pos) #needs color 
        raise "There is no piece at start position" if self[start_pos].is_a?(NullPiece)
        raise "The piece cannot move to end position" unless valid_pos?(end_pos)
        chess_p = self[start_pos]
        self[start_pos] = @sentinel.symbol
        self[end_pos] = chess_p
    end 
    
    def valid_pos?(pos)
        pos.all? {|coord| coord.between?(0,7)}
    end 
    
    def print
        puts
        grid.each do |row| 
            puts "#{row[0].symbol}  #{row[1].symbol}  #{row[3].symbol}  #{row[4].symbol}  #{row[5].symbol}  #{row[6].symbol}  #{row[7].symbol}"
        end
    end 

    
    private
    attr_reader :sentinel
end 

b = Board.new

b.move_piece([6,6],[4,6])

# b.print

p b[[7,5]].moves #6,6 5,7

# b.print

# b.print

        #grid[0].map! {|pos| fill_back_row(:black, pos) } #actual piece ... black
        # Board.fill_back_row(:black)

        # Board.fill_back_row(:white)
        #grid[7].map! {|pos| fill_back_row(:white, pos) } #actual piece ...white 
            # def self.fill_back_row(color)

    #     pieces = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]
    #     x = (color == :white) ? 7 : 0
    #     # debugger
    #     pieces.each_with_index do |piece, y|
    #         # debugger
    #         grid[x][y] = piece.new(color, self, [x,y])
    #     end
    # end
