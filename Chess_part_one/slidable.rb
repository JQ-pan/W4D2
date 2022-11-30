module Slidable

    def moves
        possible_moves = grow_unblocked_moves_in_dir
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

    private

    def grow_unblocked_moves_in_dir
        if self.move_dir == :hor
            horizontal_dirs = Hash.new {|h,k| h[k] = []}
            (@pos[1]-1).downto(0).each do |ydx|
                horizontal_dirs[:left] << [@pos[0], ydx]
            end
            (@pos[1]+1..7).each do |ydx|
                horizontal_dirs[:right] << [@pos[0], ydx]
            end
            (@pos[0]-1).downto(0).each do |xdx|
                horizontal_dirs[:up] << [xdx, @pos[1]]
            end
            (@pos[0]+1..7).each do |xdx|
                horizontal_dirs[:down] << [xdx, @pos[1]]
            end
            return horizontal_dirs
        end
        if self.move_dir == :diag
            diagonal_dirs = Hash.new {|h,k| h[k] = []}
            x = @pos[0]
            y = @pos[1]
            while x < 7 && y < 7
                x += 1
                y += 1
                diagonal_dirs[:dr] << [x,y]
            end
            x = @pos[0]
            y = @pos[1]
            while x > 0 && y < 7
                x -= 1
                y += 1
                diagonal_dirs[:ur] << [x,y]
            end
            x = @pos[0]
            y = @pos[1]
            while x < 7 && y > 0
                x += 1
                y -= 1
                diagonal_dirs[:dl] << [x,y]
            end
            x = @pos[0]
            y = @pos[1]
            while x > 0 && y > 0
                x -= 1
                y -= 1
                diagonal_dirs[:ul] << [x,y]
            end
            return diagonal_dirs
        end
        if self.move_dir == :both
            both = Hash.new{|h,k| h[k] = []}
            (@pos[1]-1).downto(0).each do |ydx|
                both[:left] << [@pos[0], ydx]
            end
            (@pos[1]+1..7).each do |ydx|
                both[:right] << [@pos[0], ydx]
            end
            (@pos[0]-1).downto(0).each do |xdx|
                both[:up] << [xdx, @pos[1]]
            end
            (@pos[0]+1..7).each do |xdx|
                both[:down] << [xdx, @pos[1]]
            end
            x = @pos[0]
            y = @pos[1]
            while x < 7 && y < 7
                x += 1
                y += 1
                both[:dr] << [x,y]
            end
            x = @pos[0]
            y = @pos[1]
            while x > 0 && y < 7
                x -= 1
                y += 1
                both[:ur] << [x,y]
            end
            x = @pos[0]
            y = @pos[1]
            while x < 7 && y > 0
                x += 1
                y -= 1
                both[:dl] << [x,y]
            end
            x = @pos[0]
            y = @pos[1]
            while x > 0 && y > 0
                x -= 1
                y -= 1
                both[:ul] << [x,y]
            end
            return both
        end
    end

    def move_dirs
        raise "Not initiated"
    end

end
