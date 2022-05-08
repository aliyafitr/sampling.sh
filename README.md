# sampling.sh
DS Batch 8 - Tugas 4 

# Note: pastikan pip untuk curl/wget, in2csv,csvstack sudah diinstall

# Membuat folder untuk data dari Github Labusiam
mkdir folder_data

# Download file dari Github Labusiam
curl -O https://github.com/labusiam/dataset/raw/main/weather_data.xlsx

# memindahkan file weather_data.xlsx. ke folder data
mv weather_data.xlsx /folder_data

# Convert file weather_data.xlsx menjadi .csv
in2csv weather_data.xlsx -sheet"weather_2014" > weather_2014.csv
in2csv weather_data.xlsx -sheet"weather_2015" > weather_2015.csv

# menggabungkan dua file csv ke satu file
csvstack weather_2014.csv weather_2015.csv > weather.csv

# remove weather_data.xlsx
rm -r weather_data.xlsx

# sampling data
cat weather.csv | sample -r 0.3 > sample_weather.csv
