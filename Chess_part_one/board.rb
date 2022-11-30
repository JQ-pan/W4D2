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

    def move_piece(color, start_pos, end_pos)
        if self[start_pos].is_a?(NullPiece)
            raise "no piece here"
        end

        if color != self[start_pos].team
            raise "not your piece"
        end

        if (end_pos[0] < 0 || end_pos[0] > 7) || (end_pos[1] < 0 || end_pos[1] > 7)
            raise "out of bounds"
        end

        unless self[start_pos].moves.include?(end_pos)
            raise "invalid move"
        end


        current = self[start_pos]
        self[start_pos] = NullPiece.instance
        self[end_pos] = current
        current.pos = end_pos

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
        puts "-----------------------------"
    end

    def start_board
        # Rook starting pos
        rook1 = Rook.new(self, [0,0], :black)
        self[[0,0]] = rook1
        self[[0,7]] = Rook.new(self, [0,7], :black)
        self[[7,0]] = Rook.new(self, [7,0], :white)
        self[[7,7]] = Rook.new(self, [7,7], :white)

        # Knight starting pos
        self[[0,1]] = Knight.new(self,[0,1], :black)
        self[[0,6]] = Knight.new(self,[0,6], :black)
        self[[7,1]] = Knight.new(self,[7,1], :white)
        self[[7,6]] = Knight.new(self,[7,6], :white)

        # Bishop starting pos
        self[[0,2]] = Bishop.new(self,[0,2], :black)
        self[[0,5]] = Bishop.new(self,[0,5], :black)
        self[[7,2]] = Bishop.new(self,[7,2], :white)
        self[[7,5]] = Bishop.new(self,[7,5], :white)

        # Queen starting pos
        self[[0,3]] = Queen.new(self,[0,3], :black)
        self[[7,3]] = Queen.new(self,[7,3], :white)

        # King starting pos
        self[[0,4]] = King.new(self,[0,4], :black)
        self[[7,4]] = King.new(self,[7,4], :white)

        #Pawns starting pos
        (0..7).each {|col| self[[1,col]] = Pawn.new(self,[1,col], :black)}
        (0..7).each {|col| self[[6,col]] = Pawn.new(self,[6,col], :white)}
        
        i = 0
        while i < @grid.length
            j = 0
            while j < @grid.length
                if self[[i,j]] == :_ 
                    self[[i,j]] = NullPiece.instance # (self,[i,j], nil)
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
b.move_piece(:black, [1,1], [2,1])
b.render
queen = b[[6,7]]
p queen.moves
b.render