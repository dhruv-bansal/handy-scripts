#myArray=("/Users/dhruvbansal/Documents/code/core-platform" "/Users/dhruvbansal/Documents/code/hgw")
myArray=("/Users/dhruvbansal/Documents/code/core-platform")

for directory in ${myArray[@]}; do
  arrlist=$(ls $directory)
  echo "size ${#arrlist[@]}"

  for subDirectory in ${arrlist[@]}; do
    echo " target parent $directory"
    echo " target sub $subDirectory"
    echo " target directory $directory/$subDirectory"
  done
done
