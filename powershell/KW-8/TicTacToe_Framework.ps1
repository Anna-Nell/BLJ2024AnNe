$board = @( ('.','.','.'),
            ('.','.','.'),
            ('.','.','.'))


$global:playerOneSymbol = 'X'
$global:playerTwoSymbol = 'O'
$global:currentPlayer = $global:playerOneSymbol 



    

function Get-Winner(){
  
}

function InsertTile($row, $col){

$board[$row][$col] = $currentPlayer
}

function  Show-Board(){
   
 Write-Host "-----------"
 Write-Host "|"$board[0][0]"|"$board[0][1]"|"$board[0][2]"|"
 Write-Host "|"$board[1][0]"|"$board[1][1]"|"$board[1][2]"|"
 Write-Host "|"$board[2][0]"|"$board[2][1]"|"$board[2][2]"|"
 Write-Host "-----------"

 
}
 
function Switch-Player(){

    if ($global:currentPlayer -eq $global:playerOneSymbol) {
        $global:currentPlayer = $global:playerTwoSymbol

    }       
    else {
        $global:currentPlayer = $global:playerOneSymbol
    
    }
}
function Run-Game(){
    #Insert-Tile $board $row $col $currentPlayer
    Write-Host " Wecome to Tic Tac Toe, let' play!"
     # Setze Spieler Eins als Startspieler
    $gameOver = $false
    while (-not $gameOver) {
        $row = Read-Host "Player $currentPlayer, choose row (0-2)"
        $col = Read-Host "Player $currentPlayer, choose column (0-2)"
        Insert-Tile $row $col
        Show-Board
        Switch-Player
    } 
}
      


Clear-Host
Run-Game -board $board -startingPlayer $playerOneSymbol


