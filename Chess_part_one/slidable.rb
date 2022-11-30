module Slidable

    def moves(pos, move_dir)
        if move_dir == :hor
            horizontal_dirs = Hash.new {|h,k| h[k] = []}
            (pos[1]-1).downto(0).each do |ydx|
                horizontal_dirs[:left] << [pos[0], ydx]
            end
            (pos[1]+1..7).each do |ydx|
                horizontal_dirs[:right] << [pos[0], ydx]
            end
            (pos[0]-1).downto(0).each do |xdx|
                horizontal_dirs[:up] << [xdx, pos[1]]
            end
            (pos[0]+1..7).each do |xdx|
                horizontal_dirs[:down] << [xdx, pos[1]]
            end
            return horizontal_dirs
        end
        if move_dir == :diag
            diagonal_dirs = Hash.new {|h,k| h[k] = []}
            x = pos[0]
            y = pos[1]
            while x < 7 && y < 7
                x += 1
                y += 1
                diagonal_dirs[:dr] << [x,y]
            end
            x = pos[0]
            y = pos[1]
            while x > 0 && y < 7
                x -= 1
                y += 1
                diagonal_dirs[:ur] << [x,y]
            end
            x = pos[0]
            y = pos[1]
            while x < 7 && y > 0
                x += 1
                y -= 1
                diagonal_dirs[:dl] << [x,y]
            end
            x = pos[0]
            y = pos[1]
            while x > 0 && y > 0
                x -= 1
                y -= 1
                diagonal_dirs[:ul] << [x,y]
            end
            return diagonal_dirs
        end
        if move_dir == :both
            moves = Hash.new{|h,k| h[k] = []}
            (pos[1]-1).downto(0).each do |ydx|
                moves[:left] << [pos[0], ydx]
            end
            (pos[1]+1..7).each do |ydx|
                moves[:right] << [pos[0], ydx]
            end
            (pos[0]-1).downto(0).each do |xdx|
                moves[:up] << [xdx, pos[1]]
            end
            (pos[0]+1..7).each do |xdx|
                moves[:down] << [xdx, pos[1]]
            end
            x = pos[0]
            y = pos[1]
            while x < 7 && y < 7
                x += 1
                y += 1
                moves[:dr] << [x,y]
            end
            x = pos[0]
            y = pos[1]
            while x > 0 && y < 7
                x -= 1
                y += 1
                moves[:ur] << [x,y]
            end
            x = pos[0]
            y = pos[1]
            while x < 7 && y > 0
                x += 1
                y -= 1
                moves[:dl] << [x,y]
            end
            x = pos[0]
            y = pos[1]
            while x > 0 && y > 0
                x -= 1
                y -= 1
                moves[:ul] << [x,y]
            end
            return moves
        end
    end
end
