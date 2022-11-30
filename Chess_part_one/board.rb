require_relative "piece.rb"

class Board
    attr_reader :grid

    def initialize
        @grid = Array.new(8) {Array.new(8, :_)}
    end

    def [](pos)
        @grid[pos[0]][pos[1]]
    end

    def []=(pos, val)
        @grid[pos[0]][pos[1]] = val # if @grid[pos] == :_
    end

    def move_piece(start_pos, end_pos)
        if self[start_pos].is_a?(NullPiece)
            raise "no piece here"
        end

        if (end_pos[0] < 0 || end_pos[0] > 7) || (end_pos[1] < 0 || end_pos[1] > 7)
            raise "out of bounds"
        end

        current = self[start_pos]
        self[start_pos] = :_
        self[end_pos] = current
    end

    



    def render
        puts "- 0 1 2 3 4 5 6 7 "
        @grid.each_with_index do |row, idx|
            print "#{idx} "
            row.each do |ele|
                print "#{ele.name} "
            end
            puts ""
        end
        return " "
    end

    def start_board
        # Rook starting pos
        self[[0,0]] = Rook.new(:R, [0,0], false)
        self[[0,7]] = Rook.new(:R, [0,7], false)
        self[[7,0]] = Rook.new(:R, [7,0], true)
        self[[7,7]] = Rook.new(:R, [7,7], true)

        # Knight starting pos
        self[[0,1]] = Knight.new(:N,[0,1], false)
        self[[0,6]] = Knight.new(:N,[0,6], false)
        self[[7,1]] = Knight.new(:N,[7,1], true)
        self[[7,6]] = Knight.new(:N,[7,6], true)

        # Bishop starting pos
        self[[0,2]] = Bishop.new(:B,[0,2], false)
        self[[0,5]] = Bishop.new(:B,[0,5], false)
        self[[7,2]] = Bishop.new(:B,[7,2], true)
        self[[7,5]] = Bishop.new(:B,[7,5], true)

        # Queen starting pos
        self[[0,3]] = Queen.new(:Q,[0,3], false)
        self[[7,3]] = Queen.new(:Q,[7,3], true)

        # King starting pos
        self[[0,4]] = King.new(:K,[0,4], false)
        self[[7,4]] = King.new(:K,[7,4], true)

        #Pawns starting pos
        (0..7).each {|col| self[[1,col]] = Pawn.new(:P,[1,col], false)}
        (0..7).each {|col| self[[6,col]] = Pawn.new(:P,[6,col], true)}
        
        i = 0
        while i < @grid.length
            j = 0
            while j < @grid.length
                if self[[i,j]] == :_ 
                    self[[i,j]] = NullPiece.new(:_,[i,j], nil)
                end
                j += 1
            end
            i += 1
        end
        
    end

end

b = Board.new
b.start_board
b.move_piece([1,0],[2,0])
b.render