#!/bin/bash

git checkout -b nowyBranch
git add plik
git commit -m "Opis commita"
git push origin nowyBranch

git checkout głównyBranch
git merge nowyBranch

if [[ $1 == "-d" ]]; then
   echo $(date)
fi

echo "*log*" > .gitignore

if [[ $1 == "-l" ]]; then
   if [[ -z $2 ]]; then
      for ((i=1; i<=100; i++))
      do
         echo "Nazwa pliku: log$i.txt" > log$i.txt
         echo "Nazwa skryptu: skrypt.sh" >> log$i.txt
         echo "Data: $(date)" >> log$i.txt
      done
   else
      count=$2
      for ((i=1; i<=$count; i++))
      do
         echo "Nazwa pliku: log$i.txt" > log$i.txt
         echo "Nazwa skryptu: skrypt.sh" >> log$i.txt
         echo "Data: $(date)" >> log$i.txt
      done
   fi
fi

if [[ $1 == "-h" ]]; then
   echo "Dostępne opcje:"
   echo "-d, -d: Wyświetlanie dzisiejszej daty"
   echo "-l [liczba], -l [liczba]: Tworzenie plików log.txt z daną liczbą plików"
   echo "-h, -h: Wyświetlenie wszystkich dostępnych opcji"
   echo "-init: Klonuje całe repozytorium do katalogu, w którym został uruchomiony, oraz ustawia ścieżkę w zmiennej środowiskowej PATH"
   echo "-e [liczba], -e [liczba]: Tworzenie plików errorx/errorx.txt, gdzie x to numer pliku od 1 do danej liczby (domyślnie 100)"
fi

git tag v1.0

git push origin głównyBranch --tags

git tag v1.0

git push origin nowyBranch --tags
