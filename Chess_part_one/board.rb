require_relative "piece.rb"

class Board
    attr_reader :grid

    def initialize
        @grid = Array.new(8) {Array.new(8, :_)}
    end

    def [](pos)
        x, y = pos[0], pos[1]
        @grid[x][y]
    end

    def []=(pos, val)
        @grid[pos] = val # if @grid[pos] == :_
    end

    def move_piece(start_pos, end_pos)
        current = @grid[start_pos]
        @grid[start_pos] = :_
        @grid[end_pos] = current
    end

    def render
        @grid.each do |row|
            # row.each do |ele|
            #     p ele.name
            # end
            p row
        end
    end

    def start_board
        # Rook starting pos
        @grid[0,0] = Rook.new(:R, [0,0])
        @grid[0,7] = Rook.new(:R, [0,7])
        @grid[7,0] = Rook.new(:R, [7,0])
        @grid[7,7] = Rook.new(:R, [7,7])

        # Knight starting pos
        @grid[0,1] = Knight.new(:N,[0,1])
        @grid[0,6] = Knight.new(:N,[0,6])
        @grid[7,1] = Knight.new(:N,[7,1])
        @grid[7,6] = Knight.new(:N,[7,6])

        # Bishop starting pos
        @grid[0,2] = Bishop.new(:B,[0,2])
        @grid[0,5] = Bishop.new(:B,[0,5])
        @grid[7,2] = Bishop.new(:B,[7,2])
        @grid[7,5] = Bishop.new(:B,[7,5])

        # Queen starting pos
        @grid[0,3] = Queen.new(:Q,[0,3])
        @grid[7,3] = Queen.new(:Q,[7,3])

        # King starting pos
        @grid[0,4] = King.new(:K,[0,4])
        @grid[7,4] = King.new(:K,[7,4])

        #Pawns starting pos
        (0..7).each {|col| @grid[1,col] = Pawn.new(:P,[1,col])}
        (0..7).each {|col| @grid[6,col] = Pawn.new(:P,[6,col])}
        
        i = 0
        while i < @grid.length
            j = 0
            while j < @grid.length
                if @grid[i,j] == :_ 
                    @grid[i,j] = NullPiece.new(O,[i,j])
                end
                j += 1
            end
            i += 1
        end
        
    end

end

b = Board.new
b.start_board
b.render