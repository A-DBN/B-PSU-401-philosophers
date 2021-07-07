if [[ ! -e ../philo ]]
then
    cd .. && make >> /dev/null && cd tests
fi

echo -e "\033[1mAfficher l'help du philo ? (yes/no)\033[0m"

read helps

if [[ $helps == "yes" ]]
then
    echo -e "\n"
    ../philo --help
    exit 0
fi

echo -e "\033[1mGive me a number of philosopher :\033[0m"

read nb_philo

echo -e "\033[1mGive a number to limite philosopher eat action :\033[0m"

read nb_eat

echo -e "\033[1mAfficher les tests fonctionnels ? (yes/no)\033[0m"

read tests

clear

testr1=$(../philo -p)
r1=$(echo $?)

testr2=$(../philo -p 5)
r2=$(echo $?)

testr3=$(../philo -e)
r3=$(echo $?)

testr4=$(../philo -e 5)
r4=$(echo $?)

testr5=$(../philo -e 5 -p)
r5=$(echo $?)

testr6=$(../philo -e 5 -p 5 -z)
r6=$(echo $?)

testr7=$(../philo -z)
r7=$(echo $?)

testr8=$(../philo -h)
r8=$(echo $?)

testr9=$(../philo --help)
r9=$(echo $?)

testr10=$(../philo -p a -e b)
r10=$(echo $?)

let "ok = 0"
let "Total = 0"

#Début des tests

echo -e "================== Tests Fonctionnels =================="
if [[ "$r1" == 84 ]]
then
    echo -e "Test 1 (.../philo -p): \033[32mOK\033[0m"
    let "ok = ok + 1"
    let "Total = Total + 1"
else
    echo -e "Test 1 (../philo -p): \033[31mKO\033[0m"
    echo -e "\t Expected : 84"
    echo -e "\t But Got : $r1"
    let "Total = Total + 1"
fi

if [[ "$r2" == 84 ]]
then
    echo -e "Test 2 (../philo -p 5): \033[32mOK\033[0m"
    let "ok = ok + 1"
    let "Total = Total + 1"
else
    echo -e "Test 2 (../philo -p 5): \033[31mKO\033[0m"
    echo -e "\t Expected : 84"
    echo -e "\t But Got : $r2"
    let "Total = Total + 1"
fi

if [[ "$r3" == 84 ]]
then
    echo -e "Test 3 (../philo -e): \033[32mOK\033[0m"
    let "ok = ok + 1"
    let "Total = Total + 1"
else
    echo -e "Test 3 (../philo -e): \033[31mKO\033[0m"
    echo -e "\t Expected : 84"
    echo -e "\t But Got : $r3"
    let "Total = Total + 1"
fi

if [[ "$r4" == 84 ]]
then
    echo -e "Test 4 (../philo -e 5): \033[32mOK\033[0m"
    let "ok = ok + 1"
    let "Total = Total + 1"
else
    echo -e "Test 4 (../philo -e 5): \033[31mKO\033[0m"
    echo -e "\t Expected : 84"
    echo -e "\t But Got : $r4"
    let "Total = Total + 1"
fi

if [[ "$r5" == 84 ]]
then
    echo -e "Test 5 (../philo -e 5 -p): \033[32mOK\033[0m"
    let "ok = ok + 1"
    let "Total = Total + 1"
else
    echo -e "Test 5 (../philo -e 5 -p): \033[31mKO\033[0m"
    echo -e "\t Expected : 84"
    echo -e "\t But Got : $r6"
    let "Total = Total + 1"
fi


if [[ "$r6" == 84 ]]
then
    echo -e "Test 6 (../philo -e 5 -p 5 -z): \033[32mOK\033[0m"
    let "ok = ok + 1"
    let "Total = Total + 1"
else
    echo -e "Test 6 (../philo -e 5 -p 5 -z): \033[31mKO\033[0m"
    echo -e "\t Expected : 84"
    echo -e "\t But Got : $r6"
    let "Total = Total + 1"
fi

if [[ "$r7" == 84 ]]
then
    echo -e "Test 7 (../philo -z): \033[32mOK\033[0m"
    let "ok = ok + 1"
    let "Total = Total + 1"
else
    echo -e "Test 7 (../philo -z): \033[31mKO\033[0m"
    echo -e "\t Expected : 84"
    echo -e "\t But Got : $r6"
    let "Total = Total + 1"
fi

if [[ "$r8" == 0 ]]
then
    echo -e "Test 8 (../philo -h): \033[32mOK\033[0m"
    let "ok = ok + 1"
    let "Total = Total + 1"
else
    echo -e "Test 8 (../philo -h): \033[31mKO\033[0m"
    echo -e "\t Expected : 0"
    echo -e "\t But Got : $r6"
    let "Total = Total + 1"
fi

if [[ "$r9" == 0 ]]
then
    echo -e "Test 9 (../philo --help): \033[32mOK\033[0m"
    let "ok = ok + 1"
    let "Total = Total + 1"
else
    echo -e "Test 9 (../philo --help): \033[31mKO\033[0m"
    echo -e "\t Expected : 0"
    echo -e "\t But Got : $r6"
    let "Total = Total + 1"
fi

if [[ "$r10" == 84 ]]
then
    echo -e "Test 10 (../philo -p a -e b): \033[32mOK\033[0m"
    let "ok = ok + 1"
    let "Total = Total + 1"
else
    echo -e "Test 10 (../philo -p a -e b): \033[31mKO\033[0m"
    echo -e "\t Expected : 84"
    echo -e "\t But Got : $r6"
    let "Total = Total + 1"
fi

#Print résultats

if [[ $ok == 0 ]]
then
    echo -e "\nPassed : \033[31m$ok\033[0m, Total : \033[32m$Total\033[0m"
elif [[ $ok == $Total ]]
then
    echo -e "\nPassed : \033[32m$ok\033[0m, Total : \033[32m$Total\033[0m"
else
    echo -e "\nPassed : \033[33m$ok\033[0m, Total : \033[32m$Total\033[0m"
fi

if [[ $tests == "no" ]]
then
    clear
fi

echo -e "\n================== Lancement Programme ==================\n"

echo -e "\033[32mStarting the project in 2 seconds with data \033[31mPhilosophers = $nb_philo\033[32m and \033[31mEat Time = $nb_eat\033[0m > \033[33m./philo -e $nb_eat -p $nb_philo\n\033[0m"

sleep 2

if [[ $ok == $Total ]]
then
    ../philo -e $nb_eat -p $nb_philo
    echo -e "\033[32mCa manque de genepi sur la table !\033[0m\n"
else
    echo -e "\033[31mImpossible de lancer le programme, les tests de base ne sont pas tous valides !\033[0m\n"
fi

echo -e "\033[1mNettoyer le dossier ? (yes/no)\033[0m"

read cleans

if [[ $cleans == "yes" ]]
then
    cd .. && make fclean
fi