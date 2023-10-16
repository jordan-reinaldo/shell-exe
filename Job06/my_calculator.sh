nombre1="$1"
symbole="$2"
nombre2="$3"

if [ "$2" = + ]
then
  resultat=$((nombre1 + nombre2))
elif [ "$2" = - ]
then
  resultat=$((nombre1 - nombre2))
elif [ "$2" = \* ]
then
  resultat=$((nombre1 * nombre2))
elif [ "$2" = / ]
then
  resultat=$((nombre1 / nombre2))
else
  echo "fail"
fi

echo "résultat: $resultat"
