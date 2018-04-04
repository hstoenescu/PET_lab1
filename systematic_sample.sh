#!/bin/bash

# script modified to make the stratified sampling

# credentials
user=root
password=hs2194acs

# db used
database=FIRST_DATA

# buffer file - used for all types
tmp_file="/tmp/data_extract"
# ordered data - region, location type and age
age_file="/tmp/stratified_sampling_age.txt"
region_file="/tmp/stratified_sampling_region.txt"
location_file="/tmp/systematic_sampling_location.txt"

if [ -f $tmp_file ]; then
	sudo rm -f $tmp_file
fi

#if [ -f $out_file ]; then
#	rm -f $out_file
#fi

####################################################
# 1
# age ordering
for i in {1..20000..200}; do
	mysql --user="$user" --password="$password" --database="$database" --execute="USE $database; SELECT * FROM people_region ORDER BY age LIMIT $i,1 INTO OUTFILE \"$tmp_file\";"
	cat $tmp_file >> $age_file
	sudo rm -f $tmp_file
done


####################################################
# 2
# region ordering
for i in {1..20000..200}; do
	mysql --user="$user" --password="$password" --database="$database" --execute="USE $database; SELECT * FROM people_region ORDER BY region_id LIMIT $i,1 INTO OUTFILE \"$tmp_file\";"
	cat $tmp_file >> $region_file
	sudo rm -f $tmp_file
done


####################################################
# 3
# location ordering
for i in {1..20000..200}; do
	mysql --user="$user" --password="$password" --database="$database" --execute="USE $database; SELECT * FROM people_region ORDER BY location_type LIMIT $i,1 INTO OUTFILE \"$tmp_file\";"
	cat $tmp_file >> $location_file
	sudo rm -f $tmp_file
done


echo "Please check the out files"
