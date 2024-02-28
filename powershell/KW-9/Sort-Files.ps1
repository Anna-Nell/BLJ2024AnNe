# Erstellen Sie einen Ordner TestingPurpose mit 2 Unterordner SubFolder1 und SubFolder2
New-Item -ItemType Directory -Path ".\TestingPurpose\SubFolder1" -Force
New-Item -ItemType Directory -Path ".\TestingPurpose\SubFolder2" -Force
# Erstellen Sie einige Testdateien in diesen Ordnern:
# 	TypeATest1.txt, TypeATest2.txt ... TypeATest50.txt in SubFolder1
# 	TypeBTest51.txt, TypeBTest52.txt ... TypeBTest100 in SubFolder2
ForEach-Object {
    if($_ % 2 -eq 0) {
       New-Item -Path ".\TestingPurpose\SubFolder1\TypeATest$_" -ItemType -Force
    }
    else {
        New-Item -Path ".\TestingPurpose\SubFolder2\TypeBTest$_" -ItemType -Force
    }

}
# Verschiebe alle Dateien, die eine ungerade Zahl im Namen haben, in SubFolder2. (Modulo)
Get-ChildItem -Path ".\TestingPurpose\SubFolder1" | Where-Object {$_.Name -match '\d+' -and [int]$Matches[0] % 2 -ne 0} Move-Item -direstory ".\Testing\SubFolder2"

# Verschiebe alle Dateien, die eine gerade Zahl im Namen haben, in SubFolder1.

# Benenne den Ordner SubFolder1 in EvenFilesContainer und SubFolder2 in OddFilesContainer um.
Rename-Item -Path ".\TestingPurpose\SubFolder1" -NewName "EvenfilesContainer" -Force
Rename-Item -Path ".\TestingPurpose\SubFolder2" -NewName "OddFilesContainer" -Force
# Erstellen Sie eine Liste aller Dateien, die sich derzeit im Ordner TestingPurpose befinden.
#      Beispiel: MasterFile.txt:

# 		Ab JJJJMMTT HH: MM befinden sich folgende Dateien in TestingPurpose:
# 		C:\TestingPurpose\EvenFilesContainer\TypeBTest2.txt
# 		.
# 		.
# 		C:\TestingPurpose\OddFilesContainer\TypeATest99.txt

# Löschen Sie alle Dateien, die mit TypeA beginnen


