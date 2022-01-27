# Ruby Chess 
<!-- ![screen shot](https://github.com/BShowen/ruby_chess/blob/master/screenshot.gif "screen shot") -->
<img src="https://github.com/BShowen/ruby_chess/blob/master/screenshot.gif" width="650" height="580" />
## Environment 
Ruby 2.5.1\
Mac OS 10.13.6\
Dependencies: colorize ~> 0.8.1

## Installation 
All dependancies will be automatically installed. Simply download this repo to your machine. Unzip the file if you need to. Open up a terminal window and cd to the directory where this file downloaded to. The command should look something like `$ cd desktop/rubychess` and then type `ruby main.rb` and a new game will begin. 

## Features 
* Move validation prevents you from moving into check
* All possible moves are highlighted when a piece is selected
    * legal moves are highlighted in green
    * a move that would put you in check/mate is highlighted in red
* User input validation
    * prevents the user from selecting opponents pieces
    * prevents the user from moving out of bounds 
    * prevents typos 
    * prevents the selection of an empty square
* Custom error class 
    * for easy debugging while developing 
    * mainly for printing out any mistakes for the user to read during gameplay e.g. selection of the wrong piece, why a move is illegal etc. 
* Serialization
    * You can save and load your game at anypoint. 
* TO-DO
    * Pawn promotion 
    * En passant 

## Code 

>I am going to over explain it. It helps me solidify what ive learned and hopefully makes it easy for you to understand :) 


There are many ways you can choose to design this program. I decided to go with an approach that followed the basic rules of Object Oriented Design. I used Encapsulation to keep classes working on one thing only and to keep interdependence as low as possible. Inheritance (in the form of modules) was adhered to in order to keep code neat, organized and as DRY as possible. Abstraction was highly adhered to in order to keep the interface as simple as possibl. There are only 6 public methods available. I didnt encounter a chance to use Polymorphism here. Maybe I did encounter a chance but didnt recognize it? Anyhow, lets get a rundown of whats happening here.

* First the board is displayed to the player and the player is asked to select a piece. 
* The player types the coordinate for the piece they want to select. For example, they type "a1", a pawn. 
* That input is then validated to ensure that... 
    1) The input is typo free.
    2) The player has not selected an opponents piece.
    3) The selected square is not blank.
* Then the board is displayed to the player again. This time with all the possible moves highlighted in green and any illegal moves highlighted in red (An illegal move is a move that would put the king in check).
* The player is then asked to select where they want to move the piece to. For example, they type "a3", two spaces ahead. 
* That input is then validated to ensure that...
    1) The input is typo free.
    2) The move is legal.
* The piece is then moved to the desired position
* At this point the board state is checked. Is the opponent in check? If so then the opponent is warned that they're in check. They are required to get the king out of check during their next move. 
* This cycle repeats itself until the board state is check_mate and the winner is declared. 

### Game board
The board is a 2D array. There is an array holding 8 additional arrays inside. Each additioanl array represents a row and holds 8 indicies. A Node is assigned to each index inside the game board during initilization. I use a node to represent each board square. A node can be empty, hold a chess piece, and also hold a background color.

### Move Validation
The hardest part of this project was figuring out the logic for each chess piece. Each piece moves slightly different from one another and also moves differently depending on the surrounding pieces. I had to come up with a way to populate a list of moves for any piece at any point in the game. For example...
* A pawn moves forward, never backward, and can move two spaces ahead but only on the first move. It can move to the side but only when attacking. 
* A king can step in any direction, but not onto his teamates. He also cant put himself in check. 
* A queen can slide in any direction but not over any pieces. 
* A knight moves in an L pattern.
* All pieces must not expose their king to being in check.
* And many other conditionals.  

To keep things organized I created modules to handle slide moves, king moves, knight moves, and pawn moves. 

* Queen, Rook, and Bishop moves are populated by using methods in the SlideMoves module. 
* King, Knight, and Pawn have their own modules for populating moves. 

### Chess Pieces
A chess piece only knows its color and it's unicode which represents its character. Chess pieces are kept as dumb as possible leaving all logic to the board which enforces encapsulation. Chess piece unicodes and colors are are used for move logic-i.e., you shouldnt be able to select opponents pieces. 

### Move Logic
When a piece is selected, its unicode is checked and then its list of moves is generated based on the unciode (character) of the chess piece. To do this I use a method called `potential_moves(current_coords)` and I pass in coordinates. This method returns a hash with all of the possible moves that a piece can make from its current position. 
>The list of moves returned by this method is a list of "potential" moves. Nothing else has been checked yet. For example, if the queen's legal move list includes the cooridnates [3,3]. That means that the queen can see that square. However, it doesnt mean she can move to that sqaure. If she moves to that sqaure and in turn exposes her king to being in check, then that wouldnt be a legal move. So we still need to iterate over this potential move list and determine which moves are legal and illegal.

My potential_moves method looks like this. 
```Ruby
#Its long, its ugly, but its mine. I need to refactor this bad boy. 

  def potential_moves(current_coords)
        moves = {
            north: [], 
            north_east: [],
            east: [],
            south_east: [], 
            south: [], 
            south_west: [], 
            west: [], 
            north_west: []
        }
        case square(current_coords).piece.character
        when "\u2654", "\u265A" #king
            moves = king_moves(current_coords, moves)
        when "\u2655", "\u265B" #queen
            moves = ascending_row(current_coords, moves)
            moves = descending_row(current_coords, moves)
            moves = vertical_row(current_coords, moves)
            moves = horizontal_row(current_coords, moves)
        when "\u2659", "\u265F" #pawn
            moves = pawn_moves(current_coords, moves)
        when "\u2658", "\u265E" #knight
            moves = knight_moves(current_coords, moves)
        when "\u2656", "\u265C" #rook
            moves = vertical_row(current_coords, moves)
            moves = horizontal_row(current_coords, moves)
        when "\u2657", "\u265D" #bishop
            moves = ascending_row(current_coords, moves)
            moves = descending_row(current_coords, moves)
        end
        moves
    end
``` 
This method returns a hash that has the following keys `:north :north_east :east :south_east :south :south_west :west :north_west`. Since a  rook can only move north, south, west and east (up, down, left and right) a hash like this will be returned. 
```Ruby
{:north=>[[3, 4], [3, 5]], :south=>[[3, 2], [3, 1]], :west=>[[2, 3], [1, 3]], :east=>[[4, 3], [5, 3]]}
```
Each key points to an array of coordinates. Those coordinates are spots on the board that the piece can move onto. 

Now is the point which I iterate over this list and determine which moves are legal and illegal. I santize this hash of potential moves into a hash of two values - `{good: [], bad: []}`. A good move is a move that can be made and it doesnt leave the king in check. A bad move is a move that, if done, would leave your king in check. I do this because in a game of chess it is illegal to put yourself in check. I also use this list to colorize the board. 

The way I do thsi is simple, but it took me days to figure it out. I do it by performing these steps. 
* First, create a hash with two keys `{good: [], bad: []}`
* Get the hash of potential moves by calling `potential_moves`
* Iterate through the hash of potential moves
* For each potential move...
    * Make the move
    * If this put my king in check then it goes into the list of bad moves. 
    * If this did not put my king in check then this move goes into the list of good moves. 
    * Undo the move
* return the hash of good/bad moves

>This is a dumbed down version of whats actually happening. I show you the code below and describe it in more detail. 

Here is the code for the steps above. 
```Ruby
#./lib/modules/board_modules/move_validation.rb

def sanitized_moves(starting_coords)
    sanitized_moves = {good: [], bad: []}
    potential_moves(starting_coords).each_value do |path|
        next if path.empty?
        path.each do |end_coord|
            make_temporary_move(starting_coords, end_coord)
            in_check? ? sanitized_moves[:bad] << end_coord : sanitized_moves[:good] << end_coord
            undo_temporary_move
        end
    end
    sanitized_moves
end

    #same code with a bunch of comments to decribe it

def sanitized_moves(starting_coords)
    sanitized_moves = {good: [], bad: []} #create the new hash
    potential_moves(starting_coords).each_value do |path| #call potential_moves to get the list of potential moves for a chess piece. 
        next if path.empty? #skip over any empty paths. 
        path.each do |end_coord| #iterate over each path's set of corrdinates. 
            make_temporary_move(starting_coords, end_coord) #make the potential move. Calm down is only temporary. 
            in_check? ? sanitized_moves[:bad] << end_coord : sanitized_moves[:good] << end_coord #check our board state and add that coordinate to the appropriate hash key - i.e. :good or :bad
            undo_temporary_move #undo that move. 
        end
    end
    sanitized_moves #return that nice clean list of moves. 
end
```

Now, I do this for two reasons. One, you're not allowed to make a move that puts the king in check. By sanitizing these moves into `:good` and `:bad` it makes it easy to enforce this rule. Your're only allowed to move to coordinates that are in the `:good` list. Two, I use this list to color the chess board. I color the squares green if you can move on them and red if you cant move on them. 

### Check and CheckMate

You are in check if...
* Your king is in the attack path of an opponents piece. 

You are in Checkmate if...
* Your king is in the attack path of an opponents piece AND
* Your king has no legal moves AND
* Your teammates can't help you. (In other words, they cant come between the king and the attacker or take out the attacker)
>These are almost the exact names that I use for the conditionals in the `check_mate?` method. 

Heres how I coded check. 
```Ruby
#./lib/classes/board.rb

def in_check?
        king = find_king_coords #get the coordinates of your king. 
        each_square do |column, row, sqr| #iterate over each board square. 
            next if sqr.empty? || sqr.piece.color == @current_turn_color || sqr.piece.is_king? #self explanatory 
            potential_moves([column, row]).each_value do |attack_path| #iterate over all attack paths for every opponents piece.
                next if attack_path.empty? #skip any empty paths. 
                return true if attack_path.include?(king) #king is in check if your king's coordinates exist in the attack path of any opponents piece. 
            end
        end
        false
    end
```

and here is how I wrote check mate

```Ruby
#./lib/classes/board.rb

0  def check_mate?
1        king = find_king_coords #get the coordinates of your king. 
2       if sanitized_moves(king)[:good].empty? == true && in_check? == true && can_teammates_help?(king) == false
3           true
4       else
5           false
6       end
7   end
# On line 2 im saying "if the king has no moves AND the king is in check AND his teammates cant help, then the king is in checkmate." 
```

# Thats it for now. 

That is a lot to comprehend. Especially if you're fairly new to all of this, which I am. As I continue to study, code, and learn I will pop back in here and probably refactor it. Until then, its perfect.

Thanks for checking it out!
