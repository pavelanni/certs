#!/bin/sh
# This generates index.html from the files in the $1 directory

cd $1
if [ -f index.html ] ; then
    rm index.html
fi
echo '<!doctype html>' >> index.html
echo '<html><head>' >> index.html
echo '<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">' >> index.html
echo '</head><body>' >> index.html
echo '<div class="container"><h1>Certificate Expiration Reports</h1></div>' >> index.html
echo '<div class="container">' >> index.html
for f in *
  do 
    if [[ $f != "index.html" ]] 
    then echo "<a href='${f}'>${f}</a><br/>" >> index.html
    fi 
done
echo '</div>' >> index.html
echo '</body></html>' >> index.html
