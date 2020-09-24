require_relative 'piece'

class Queen < Piece
  include Slideable
  

  def symbol
    '♛'#.colorize(color)
  end

  protected

  def move_dirs
    orthogonal_dirs + diagonal_dirs
  end
end