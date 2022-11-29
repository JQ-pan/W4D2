# require_relative "board.rb"

class Piece 
    def initialize(name, pos)
        @name = name
        @pos = pos
    end
end

class Sliding_pieces < Piece
    def initalize(name, pos)
        super
    end
end

class Stepping_pieces < Piece
    def initalize(name, pos)
        super
    end
end

class Queen < Sliding_pieces
    def initialize(name, pos)
        super
    end
end

class Rook < Sliding_pieces
    def initialize(name, pos)
        super
    end
end

class Knight < Stepping_pieces
    def initialize(name, pos)
        super
    end
end

class Bishop < Sliding_pieces
    def initialize(name, pos)
        super
    end
end

class King < Stepping_pieces
    def initialize(name, pos)
        super
    end
end

class Pawn < Piece
    def initialize(name, pos)
        super
    end
end

class NullPiece < Piece
    def initialize(name, pos)
        super
    end
end