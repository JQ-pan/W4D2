# require_relative "board.rb"
require_relative "slidable"

class Piece 

    attr_reader :name, :team, :pos
    def initialize(board, pos, team)
        @board = board
        @pos = pos
        @team = team
        @symbol = nil
        @move_dir = nil
    end

    def empty?
        self.is_a?(NullPiece)
    end

    def pos=(new_pos)
        @pos = new_pos
    end

    def valid_moves
        
    end


    def name
        @symbol
    end
end

class Sliding_pieces < Piece
    include Slidable
    def initalize(board, pos, team)
        super
    end

    def valid_moves
        possible_moves = moves(pos, @move_dir)
        select_moves = []
        possible_moves.each do |dir, arr|
            arr.each do |xy|
                if @board[xy].is_a?(NullPiece)
                    select_moves << xy
                elsif @board[xy].team == self.team
                    break
                else
                    select_moves << xy
                    break
                end
            end
        end
        select_moves
    end
end

class Stepping_pieces < Piece
    def initalize(board, pos, team)
        super
    end
end

class Queen < Sliding_pieces
    def initialize(board, pos, team)
        super
        @symbol = :Q
        @move_dir = :both
    end
end

class Rook < Sliding_pieces
    def initialize(board, pos, team)
        super
        @symbol = :R
        @move_dir = :hor
    end

    
end

class Knight < Stepping_pieces
    def initialize(board, pos, team)
        super
        @symbol = :N
    end
end

class Bishop < Sliding_pieces
    def initialize(board, pos, team)
        super
        @symbol = :B
        @move_dir = :diag
    end
end

class King < Stepping_pieces
    def initialize(board, pos, team)
        super
        @symbol = :K
    end
end

class Pawn < Piece
    def initialize(board, pos, team)
        super
        @symbol = :P
    end
end

class NullPiece < Piece
    def initialize(board, pos, team)
        super
        @symbol = :_
    end
end

