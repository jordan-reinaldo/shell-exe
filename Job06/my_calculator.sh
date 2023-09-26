nombre1="$1"
symbole="$2"
nombre2="$3"

if [ "$2" = + ]; 
then resultat=$(("$1" + "$3"))
elif [ "$2" = - ]; 
then resultat=$(("$1" - "$3"))
elif [ "$2" = * ]; 
then resultat=$(("$1" * "$3"))
elif [ "$2" = / ]; 
then resultat=$(("$1" / "$3"))
else echo "fail"
fi

echo "résultat: $resultat"
