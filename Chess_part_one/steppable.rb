module Steppable

    def moves
        check = self.move_diffs
        check.select{|pos| pos.is_a?(NullPiece) || @board[pos].team != self.team}
    end

    def move_diffs
        raise "Not initiated"
    end

end