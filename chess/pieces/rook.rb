require_relative "piece.rb"

class Rook < Piece
    include Slideable

    def symbol
        '♜'#.colorize(color)
    end

    protected
    def move_dirs
        orthogonal_dirs
    end
end