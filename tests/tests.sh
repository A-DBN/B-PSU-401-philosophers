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

echo -e "================== Tests Fonctionnels ==================\n"

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
    echo -e "Passed : \033[31m$ok\033[0m, Total : \033[32m$Total\033[0m"
elif [[ $ok == $Total ]]
then
    echo -e "Passed : \033[32m$ok\033[0m, Total : \033[32m$Total\033[0m"
else
    echo -e "Passed : \033[33m$ok\033[0m, Total : \033[32m$Total\033[0m"
fi

#echo -"=============Test Unitaires============="

#./test