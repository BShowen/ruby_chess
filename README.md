# Ruby Chess 
I used Encapsulation, Inheritance, Abstraction as best as I could in order to adhere to Object Oriented Principles. I didnt see an oporunity to apply Polymorphism while writting this code. 

## Environment 
Ruby 2.5.1\
Mac OS 10.13.6\
Gems used: colorize (0.8.1)

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

##### TO-DO
* JSON Serialization for saving and resuming gameplay 
* Pawn promotion 
* En passant 

## Code

The hardest part to code was the logic for validating moves. I came up with two options to do this logic. 

1) I could allow each chess piece to build its own adjacency list of moves relative to it's current position. 
This would break the rule of encapsulation because each chess piece would have to...
    * know the state of the board in order to not move into check. 
    * know the state of all other chess pieces in order to know where it can/cant move.
2) I could allow to board to handle move validation by creating a list of moves for each chess piece on demand from its current position. This would agree with the rule of encapsulation. The board knows its own state and can enforce constraints on the chess pieces

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

