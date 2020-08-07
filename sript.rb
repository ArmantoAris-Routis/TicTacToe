board = {topL:" ",topM:" ", topR: " ",
midL: " ",midM: " ", midR: " ",
lowL:" ",lowM:" ",lowR:" "}


winner = " "
turn = "x"
counter = 0

def board_display(board)
    print board[:topL] + "|" + board[:topM] + "|" + board[:topR] + "\n"
    print "-----\n"
    print board[:midL] + "|" + board[:midM] + "|" + board[:midR] + "\n"
    print "-----\n"
    print board[:lowL] + "|" + board[:lowM] + "|" + board[:lowR] + "\n"
end

def play(board,turn)
    puts "Player "+turn+" choose your move"
    move = gets.chomp
    while board[move.to_sym] != " "
        puts "That spot is taken try a diferent one"
        move = gets.chomp
    end
    if turn == "x"
        board[move.to_sym] = turn
        turn = "o"
    elsif turn == "o"
        board[move.to_sym] = turn
        turn = "x"
    end
    board_display(board)
    return turn
end


def check(board, winner)
    if (board[:topL] == board[:topM] && board[:topR] == board[:topM]) && board[:topL] != " "
        return board[:topL]
    elsif (board[:midL] == board[:midM] && board[:midR] == board[:midM]) && board[:midL] != " "
        return board[:midL]
    elsif (board[:lowL] == board[:lowM] && board[:lowR] == board[:lowM]) && board[:lowL] != " "
        return board[:lowL]
    elsif (board[:topL] == board[:midL] && board[:midL] == board[:lowL]) && board[:topL] != " "
        return board[:topL]
    elsif(board[:topM] == board[:midM] && board[:midM] == board[:lowM]) && board[:topM] != " "
        return board[:topM]
    elsif(board[:topR] == board[:midR] && board[:midR] == board[:lowR]) && board[:topR] != " "
        return board[:topR]
    elsif(board[:topR] == board[:midM] && board[:midM] == board[:lowL]) && board[:topR] != " "
        return board[:topR]
    elsif(board[:topL] == board[:midM] && board[:midM] == board[:lowR]) && board[:topR] != " "
        return board[:topL]
    else 
        return " "
    end
end

while winner == " " && counter<9
    turn = play(board, turn)
    winner = check(board,winner)
    counter +=1
end

if winner == " " && counter == 9
    puts "It's a draw"
else
    puts "The winner is player "+winner
end