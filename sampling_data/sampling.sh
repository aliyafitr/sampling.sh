#!/bin/bash

echo "Tugas 4 Shell Tooling Aliya Fitri"
date

echo "Membuat folder untuk data dari Github Labusiam"
mkdir folder_data

echo "Download file dari Github Labusiam"
curl -O https://github.com/labusiam/dataset/raw/main/weather_data.xlsx

echo "memindahkan file weather_data.xlsx. ke folder data"
mv weather_data.xlsx /folder_data

echo "Convert file weather_data.xlsx menjadi .csv"
in2csv weather_data.xlsx -sheet"weather_2014" > weather_2014.csv
in2csv weather_data.xlsx -sheet"weather_2015" > weather_2015.csv

echo "menggabungkan dua file csv ke satu file"
csvstack weather_2014.csv weather_2015.csv > weather.csv

echo "remove weather_data.xlsx"
rm -r weather_data.xlsx

echo "sampling data"
cat weather.csv | sample -r 0.3 > sample_weather.csv

