#!/bin/bash
#  
# Use the provided lists or add you own
# https://oisd.nl/includedlists/whitelists
# by creating an empty whitelist.csv file
touch whitelist.csv

# declare an array of urls
urls=(
    https://raw.githubusercontent.com/bigdargon/hostsVN/master/option/domain.txt
    https://adguardteam.github.io/AdGuardSDNSFilter/Filters/filter.txt
    https://raw.githubusercontent.com/nextdns/click-tracking-domains/main/domains
)

# loop through the urls and download each file with curl
for url in "${urls[@]}"; do
  # get the file name from the url
  file=$(basename "$url")
  # download the file with curl and save it as file.txt
  curl -o "$file.txt" "$url"
  # append the file contents to whitelist.csv and add a newline
  cat "$file.txt" >> whitelist.csv
  echo "" >> whitelist.csv
  # remove the file.txt
  rm "$file.txt"
done

# print a message when done
echo "Done. The whitelist.csv file contains merged data from recommended whitelists."
