# Afficher de l'aide en argument bash

verify_all || exit $?

if [[ "$1" == "--help" ]];

then

        echo "  --option1=   Ceci est l’option 1"

        echo "  --option2=         Ceci est l’option 2"

        echo "  ex: sudo ./monscript –option1 –option2"

else

       

fi
