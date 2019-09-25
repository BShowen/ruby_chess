# Ruby Chess 
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
* Human input validation
    * prevents you from selecting opponents pieces
    * prevents you from moving out of bounds 
    * prevents typos 
    * prevents the selection of an empty square
* Custom error class 
    * for easy debugging while developing 
    * mainly for printing out any mistakes for the human to read during gameplay e.g. selection of the wrong piece, why a move is illegal etc. 
* TO-DO
    * JSON Serialization for saving and resuming gameplay 
    * Pawn promotion 
    * En passant 

## Code 
##### I am going to over explain it. It helps me solidify what ive learned and hopefully makes it easy for you to understand :) 

There are many ways you can choose to design this program. I decided to go with an approach that followed the basic rules of Object Oriented Design. I used Encapsulation to keep classes working on one thing only and to keep interdependence as low as possible. Inheritance was adhered to in order to keep code neat, organized and as DRY as possible. Abstraction was highly adhered to in order to keep the interface as simple as possible, tucking away all the logic going on behind the scenes. I didnt encounter a chance to use Polymorphism here. Maybe I did encounter a chance but didnt recognize it? Anyhow, lets get a rundown of whats happening here.

* First the board is displayed to the player and the player is asked to select a piece. 
* The player types the coordinate for the piece they want to seelct. For example, they type "a1", a pawn. 
* That input is then validated to ensure that... 
    1) The input is typo free.
    2) The player has not selected an opponents piece.
    3) The selected square is not blank.
* Then the board is displayed to the players again with all the possible moves highlighted in green and any illegal moves highlighted in red. An illegal move is a move that would put the king in check. 
* The player is then asked to select where they want to move the piece to. For example, they type "a3", two spaces ahead. 
* That input is then validated to ensure that...
    1) The input is typo free.
    2) The move is legal.
* The piece is then moved to the desired position
* At this point the board state is checked. Is the opponent in check? If so then the opponent is warned that theyre in check. They are required to get the king out of check during their next move. 
* This cycle repeats itself until the board state is check_mate and the winner is declared. 

Okay, now for the nitty gritty
### Move validation
The hardest part of this project was figuring out the logic for each chess piece. Since each piece moves slightly different from one another and also moves differently depending on the surrounding pieces I had to come up with a way to populate a list of moves for any piece at any point in the game. For example, a pawn moves forward, never backward. A king can step in any direction. A queen can slide in any direction. A knight moves in an L pattern and etc. To keep things organized I created modules to handle slide moves, king moves, knight moves, and pawn moves. 

A chess piece holds a unicode representing its character, and its color. This is needed for move validation to work.

When a piece is selected, its unicode is checked and then its list of moves is generated based on the unciode (character) of the chess piece. To do this I use a method called `potential_moves(current_coords)` and I pass in coordinates. This method returns a hash with all of the possible moves that a piece can make from its current position. 
```Ruby
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

Next, I take this hash of potential moves and I sanitize it into a hash of only two values `{good: [], bad: []}`. A good move is a move that can be made and it doesnt leave the king in check. A bad move is a move that, if done, would leave your king in check. I do this because in a game of chess it is illegal to put yourself in check. I use this list to colorize the board. I make this list by performing these steps.
* First, create a hash with two keys `{good: [], bad: []}`
* Get the hash of potential moves by calling `potential_moves`
* Iterate through the hash of potential moves
* For each potential move...
    * Make the move
    * If this put my king in check then it goes into the list of bad moves. 
    * If this did not put my king in check then this move goes into the list of good moves. 
    * Undo the move
* return the hash of good/bad moves

Here is the code for the steps above. 
```Ruby
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
```


### Game board
The board is a 2D array. There is an array holding 8 additional arrays inside. Each additioanl array represents a row and holds 8 indicies. A Node is assigned to each index inside the game board during initilization of the game board. I use a node to represent each board square and a node can be empty, hold chess piece, and also hold a background color, which is used for highlighting move paths. This is how I wrote the code to do this. 
```Ruby
# ./lib/classes/board.rb
def initialize
    @object_board = Array.new(8) {Array.new(8){Node.new} }
    . . . 
end

# ./lib/classes/node.rb
class Node
    attr_accessor :piece, :background

    def initialize 
        @piece = nil
        @background = nil
    end

    def empty?
        @piece == nil
    end
end
```

### Chess pieces
I have one class that is used to represent a chess piece. It holds the characters piece, color, and responds to `is_king?`. 

