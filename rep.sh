#!/bin/bash

# Tworzenie nowego brancha, dodawanie zmienionych plików, wykonanie commita i wysłanie zmian na zdalne repozytorium
git checkout -b nowyBranch
git add plik
git commit -m "Opis commita"
git push origin nowyBranch

# Przechodzenie na główny branch i mergowanie wykonanego zadania
git checkout nowyBranch
git merge nowyBranch

# Wyświetlanie dzisiejszej daty za pomocą skryptu "skrypt.sh"
if [[ $1 == "--date" ]]; then
   echo $(date)
fi

# Utworzenie pliku .gitignore, który będzie ignorować wszystkie pliki zawierające w nazwie ciąg znaków "log"
echo "*log*" > .gitignore

# Tworzenie automatycznie 100 plików logx.txt, gdzie x to numer pliku od 1 do 100, zawierających nazwę pliku, nazwę skryptu i datę
if [[ $1 == "--logs" ]]; then
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

# Wyświetlanie wszystkich dostępnych opcji za pomocą skryptu "skrypt.sh --help"
if [[ $1 == "--help" ]]; then
   echo "Dostępne opcje:"
   echo "--date: Wyświetlanie dzisiejszej daty"
   echo "--logs [liczba]: Tworzenie plików log.txt z daną liczbą plików"
   echo "--help: Wyświetlenie wszystkich dostępnych opcji"
fi

# Utworzenie Tagu v1.0 dla aktualnej wersji skryptu/commita na głównej gałęzi
git tag v1.0

# Wysyłanie zmian do zdalnego repozytorium na GitHubie
git push origin nowyBranch --tags
