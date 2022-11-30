# require_relative "board.rb"
require_relative "slidable"
require_relative "steppable"
require 'byebug'
class Piece 

    attr_reader :name, :team, :pos
    def initialize(board, pos, team)
        @board = board
        @pos = pos
        @team = team
        @symbol = nil
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
end

class Stepping_pieces < Piece
    include Steppable
    def initalize(board, pos, team)
        super
    end
end

class Queen < Sliding_pieces
    def initialize(board, pos, team)
        super
        @symbol = :Q
    end

    def move_dir
        @move_dir = :both
    end
end

class Rook < Sliding_pieces
    def initialize(board, pos, team)
        super
        @symbol = :R
    end

    def move_dir
        @move_dir = :hor
    end
end

class Bishop < Sliding_pieces
    def initialize(board, pos, team)
        super
        @symbol = :B
    end

    def move_dir
        @move_dir = :diag
    end
end

class Knight < Stepping_pieces
    def initialize(board, pos, team)
        super
        @symbol = :N
    end

    def move_diffs
        arr = []
        x,y = @pos
        arr << [x-2,y+1]
        arr << [x-2,y-1]
        arr << [x+2,y+1]
        arr << [x+2,y-1]
        arr << [x-1,y+2]
        arr << [x-1,y-2]
        arr << [x+1,y+2]
        arr << [x+1,y-2]
        final_arr = arr.select {|ele| (0..7).include?(ele[0]) && (0..7).include?(ele[1])}
        final_arr
    end
end

class King < Stepping_pieces
    def initialize(board, pos, team)
        super
        @symbol = :K
    end

    def move_diffs
        arr = []
        x,y = @pos
        arr << [x-1,y-1]
        arr << [x-1,y]
        arr << [x-1,y+1]
        arr << [x,y+1]
        arr << [x+1,y+1]
        arr << [x+1,y]
        arr << [x+1,y-1]
        arr << [x,y-1]
        final_arr = arr.select {|ele| (0..7).include?(ele[0]) && (0..7).include?(ele[1])}
        final_arr
    end
end

class Pawn < Piece
    def initialize(board, pos, team)
        super
        @symbol = :P
    end

    def moves
        # debugger
        all_moves = []
        all_moves += side_attacks
        x,y = @pos

        forward_steps.times do 
            x += forward_dir
            if @board[[x,y]].is_a?(NullPiece)
                all_moves << [x,y]
            end
        end
        all_moves
    end


    def at_start_row?
        if @pos[0] == 1 && @team == :black
            return true
        elsif @pos[0] == 6 && @team == :white
            return true
        else
            return false
        end
    end

    def forward_dir
        if @team == :black
            return 1
        end
        if @team == :white
            return -1
        end
    end

    def forward_steps
        if self.at_start_row?
            return 2
        else
            return 1
        end
    end

    def side_attacks
        arr = []
        x, y = @pos
        if @team == :black
            arr << [x+1,y-1] if @board[[x+1,y-1]].team == :white
            arr << [x+1,y+1] if @board[[x+1,y+1]].team == :white
        end

        if @team == :white
            arr << [x-1,y-1] if @board[[x-1,y-1]].team == :black
            arr << [x-1,y+1] if @board[[x-1,y+1]].team == :black
        end
        return arr
    end
end

require 'singleton'
class NullPiece < Piece

include Singleton
    def initialize
        @team = nil
        @symbol = :_
    end
end

