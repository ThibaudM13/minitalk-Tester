#!/bin/zsh

PATH_TO_CLIENT="../client"

# Colors
Black='\e[0;30m'
D_Gray='\e[1;30m'
Red='\e[0;31m'
L_Red='\e[1;31m'
Green='\e[0;32m'
L_Green='\e[1;32m'
Orange='\e[0;33m'
Yellow='\e[1;33m'
Blue='\e[0;34m'
L_Blue='\e[1;34m'
Purple='\e[0;35m'
L_Purple='\e[1;35m'
Cyan='\e[0;36m'
L_Cyan='\e[1;36m'
L_Gray='\e[0;37m'
White='\e[1;37m'
NC='\e[0m' 

###################
# Preparing tests #
###################

for init in tm tb t2 t3 t4 t5 t6 p_id
do
    export $init=0
done

for i in $@
do
    case $i in
        -m) tm=1;;
        -b) tb=1;;
        "-1") t1=1;;
        "-2") t2=1;;
        "-3") t3=1;;
        "-4") t4=1;;
        "-5") t5=1;;
        "-6") t6=1;;
        *) if [[ $p_id = 0 ]] ; then p_id=$i; else echo "[ERROR] Please enter correct arg when launching."; exit; fi;;
    esac
done

if ! [[ $p_id =~ [0-9]+ ]]
then 
    echo "[ERROR] Please enter correct arg when launching."
    exit
fi


###########
# Testing #
###########

######## SPEED TEST #########

echo "${L_Green} [Speed test]\tTime to print 1 000 char ${NC}"
time $PATH_TO_CLIENT "...................................................................................................
...................................................................................................
...................................................................................................
...................................................................................................
...................................................................................................
...................................................................................................
...................................................................................................
...................................................................................................
...................................................................................................
...................................................................................................
" $p_id



######## MANDATORY #########

### Test 1 ###
if [[ $t1 == 1 || $tm == 1 ]]
then
    echo "${L_Green} [Test 1]\tBasic test ${NC}"
    $PATH_TO_CLIENT "Hello, this is a first test" $p_id
fi

### Test 2 ###
if [[ $t2 == 1 || $tm == 1 ]]
then
    echo "${L_Green}[Test 2]\tEmpty string${NC}"
    $PATH_TO_CLIENT "" $p_id
fi

### Test 3 ###
if [[ $t3 == 1 || $tm == 1 ]]
then
    echo "${L_Green}[Test 3]\tSending big big str with 5 000 char${NC}"
    $PATH_TO_CLIENT "
        .--..--..--..--..--..--.                                 .-\"\"\"-.
        .' \\  (\`._   (_)     _   \\                                /       \\
    .'    |  '._)         (_)  |                                \\       /
    \\ _.')\\      .----..---.   /                         .-\"\"\"-.-\`.-.-.<  _
    |(_.'  |    /    .-\\-.  \\  |                        /      _,-\\ O_O-_/ )
    \\     0|    |   ( O| O) | o|                        \\     / ,  \`   . \`|
    |  _  |  .--.____.'._.-.  |                         '-..-| \\-.,__~ ~ /
    \\ (_) | o         -\` .-\`  |                               \\ \`-.__/  /
        |    \\   |\`-._ _ _ _ _\\ /                               / \`-.__.-\\\`-._    ,\",
        \\    |   |  \`. |_||_|   |                              / /|    ___\\-._\`-.;  , .----.
        | o  |    \\_      \\     |     -.   .-.                ( ( |.-\"\`   \`'\\ '-(     -.---'
        |.-.  \\     \`--..-'   O |     \`.\`-' .'                 \\ \\/    {}{}  |   \\.__.-'
    _.'  .' |     \`-.-'      /-.__   ' .-'                    \\|           /
    .' \`-.\` '.|='=.='=.='=.='=|._/_ \`-'.'                        \\        , /
    \`-._  \`.  |________/\\_____|    \`-.'                          ( __\`;-;'__\`)
    .'   ).| '=' '='\\/ '=' |                                  \`//'\`   \`||\`
    \`._.\`  '---------------'                                 _//       ||
            //___\\   //___\\                          .-\"-._,(__)     .(__).-\"\"-.
                ||       ||                           /          \\    /           \\
                ||_.-.   ||_.-.                       \\          /    \\           /
                (_.--__) (_.--__)                       \`'-------\`      \`--------'\`
    _____________________________________________________________________________________________________
                        ,,,,                                       .  .
                ,;) .';;;;',                                       |\\_|\\
    ;;,,_,-.-.,;;'_,|I\\;;;/),,_                                    | a_a\\
    \`';;/:|:);{ ;;;|| \\;/ /;;;\\__                                 | | \"]
        L;/-';/ \\;;\\',/;\\/;;;.') \\                            ____| '-\\___
        .:\`''\` - \\;;'.__/;;;/  . _'-._                       /.----.___.-'\\
        .'/   \\     \\;;;;;;/.'_7:.  '). \\_                    //        _    \\
    .''/     | '._ );}{;//.'    '-:  '.,L                  //   .-. (~v~) /|
    .'. /       \\  ( |;;;/_/         \\._./;\\   _,           |'|  /\\:  .--  / \\
    . /        |\\ ( /;;/_/             ';;;\\,;;_,         // |-/  \\_/____/\\/~|
    . /         )__(/;;/_/                (;;'''''        |/  \\ |  []_|_|_] \\ |
    /        _;:':;;;;:';-._             );              | \\  | \\ |___   _\\ ]_}
    /        /   \\  \`'\`   --.'-._         \\/              | |  '-' /   '.'  |
        .'     '.  ,'         '-,                      | |     /    /|:  |
        /    /   r--,..__       '.\\                     | |     |   / |:  /\\
        .'    '  .'        '--._     ]                    | |     /  /  |  /  \\
        (     :.(;>        _ .' '- ;/                     | |    |  /  /  |    \\
        |      /:;(    ,_.';(   __.'                      \\ |    |/\\/  |/|/\\    \\
        '- -'\"|;:/    (;;;;-'--'                          \\|\\ |\\|  |  | / /\\/\\__\\
            |;/      ;;(                                 \\ \\| | /   | |__
            ''      /;;|                                      / |   |____)
                    \\_/                                       |_/
    " $p_id
fi

### Test 4 ###
if [[ $t4 == 1 || $tm == 1 ]]
then
    echo "${L_Green} [Test 4]\tSending str with 3 800 char (10 times) ${NC}"

    for i in 1 2 3 4 5 6 7 8 9 10
    do
        echo -n "${Green}[ ${i} ]${NC} "
        $PATH_TO_CLIENT "
        ......................._,,-~'''¯¯¯''~-,,
        ....................,-'' ;; ;_,,---,,_ ;;''-,..................................._,,,---,,_
        ...................,' ;; ;,-' ;,, ;,;,, '-, ;;'-,,,,---~~''''''~--,,,_.....,,-~'' ;; ;;__;'-,
        ...................| ;; ;,' ;,;,, _,,-~'' ;; ;; ;; ;; ;; ;; ;; ; ¯''~'-,,_ ,,-~'' ;,, ', ;',
        ...................', ;; '-;,,-~'' ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;''-;,, ;,, ;,,' ; |
        .....................', ;;,'' ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;;'-;,;,,-' ;,-'
        ......................,'-' ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;''-' ;,,-'
        ....................,' ;; ;; ;; ;; ;; ;;__ ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; '-,'
        ..................,-' ;; ;; ;; ;; ;;,-''¯: : ''-, ;; ;; ;; ;; ;; ;; ;; ; _ ;; ;; ;',
        .................,' ;; ;; ;; ;; ;; ;| : : : : : ;; ;; ;; ;; ;; ;; ,-''¯: ¯''-, ;; ;',
        ................,' ;; ;; ;; ;; ;; ; '-,_: : _,-' ;; ;; ;; ;; ;; ;; | : : : : : ;; ; |
        ...............,' ;; ;; ;; ;; ;; ;; ;; ¯¯ ;; ;; ;; ;; ;; ;; ;; ;'-,,_ : :,-' ;; ;;|
        ..............,-' ;; ;; ;; ;; ;; ;; ;; ,,-~'' ;,, ;,;,,,,-~~-;,, ;,, _ ;; ;¯¯ ;; ;; ;|
        ..............,-' ;; ;; ;; ;; ;; ;; ;; ;,' ;,, ;,, ;,;,,( : : : : ;,, ;,,''-, ;; ;; ;; ;;|
        ..........,-' ;; ;; ;; ;; ;; ;; ;; ;;';,, ;,, ;,, ;,;,,'~---~'' ;,, ;,, ;,,' ;; ;; ;; ;;',
        .......,-'' ; _, ;; ;; ;; ;; ;; ;; ;; ; ''~-,,,,--~~'''¯'''~-,,_ ;,,_,-' ;; ;; ;; ;; ; ',
        ....,-''-~'',-' ;; ;; ;; ;; ;; ;; ;; ;; ;; | ;; | . . . . . . ,'; ,''¯ ;; ;; ;; ;; ; ,_ ; '-,
        ..........,' ;;,-, ;;, ;; ;, ;; ;; ;; ;; ;; ', ;;', . . . . .,' ;,' ;; ;;, ;; ;,'-, ;;,' ''~--'''
        .........,'-~' ,-'-~'' ';,,-' ';,,,- ;; ;; ;; ;; ', ;; '~-,,,-'' ; ,' ;; ;; ', ;,-'' ; ';,,-',
        ..........,-'' ;; ;; ; '' ;; ;'' ;; ;; ;; ;; ;; ''-,,_ ;; ; _,-' ;; ;; ;;'-'' ;; ; '' ;;'-,
        ........,-' ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;¯¯''¯ ;; ;; ;; ;; , ;; ;; ;; ;; ;''-,
        ......,-' ;; ;; ;; ; ,, ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ; |, ;; ;; ;; ;; ;; '-,
        .....,' ;; ;; ;; ;;,' ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;;|..'-,_ ;; ; , ;; ;; ;
        ....,' ;; ;; ;; ;; | ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;;,'.......''',-~' ;; ;; ; ,'
        ...,' ;; ;; ;; ;; ;'~-,,,,,--~~''''''~-,, ;; ;; ;; ;; ;; ;; ;; ;; ;;,'.....,-~'' ;; ;; ;; ,-
        ...| ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ; ', ;; ;; ;; ;; ;; ;; ;; ;; ;,'...,-' ;; ;; ;; ;;,-'
        ...', ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ,-' ;; ;; ;; ;; ;; ;; ;; ;; ,'....', ;; ;; _,,-''
        ....', ;; ;; ;; ;; ;; ;; ;; ;; ;; ,-'' ;; ;; ;; ;; ;; ;; ;; ;; ;,'.......''~~''¯
        .....''-, ;; ;; ;; ;; ;; ;; ;;_,,-'' ;; ;; ;; ;; ;; ;; ;; ;; ; ,-'
        .........''~-,,_ ;; ;; _,,,-~'' ;; ;; ;; ;; ;; ;; ;; ;; ;; ;;,-'
        ...........| ;; ;¯¯''''¯ ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;,,-'
        ...........', ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;,-'
        ............| ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;; ;|
        ............', ;; ;; ;; ;; ; ~-,,___ ;; ;; ;; ;; ;; ;; ;;',
        .............', ;; ;; ;; ;; ;; ;,-'....''-, ;; ;; ;; ;; ;; ;; ',
        ...........,' '- ;; ;; ;; ;; ;,-''..........'-, ;; ;; ;; ;; ;; ; ',
        ..........,' ;;' ;; ;; ;; ,,-'................', ;; ;; ;; ;; ;; ;',
        .........,' ;; ;; ;; ;;,-''.....................''-, ;; ;; ;; ;; ; |
        ........,' ;; ;; ;; ;,,-'...........................'', ;; ;; ;; ;; |
        ........| ;; ;; ;; ;,'..............................,' ;; ;; ;; ;;,'
        ........| ;; ;; ;; ,'.............................,-' ;; ;; ;; ; ,''
        ........| ;; ;; ;;,'............................,-' ;; ;; ;; ; ,-'
        ........',_ , ; , ;,'............................,' ;; ;; ;; ; ,-'
        .........',,',¯,',''|............................| ;; ;; ;; ;; '--,,
        .............¯...''.............................'-, ;; ;; ;; ;; ;;''~,,
        ...................................................''-,, ;; ;; ;; ;; ;;''~-,,
        ........................................................''-, ;; ;; ; ,,_ ;;'-,''-,
        ...........................................................', ;; ;; ;; '-,__,--.
        ............................................................'-, ;; ;,,-~''' ;,,|, |
        ...............................................................''~-''_ ;,;,,,',_/--'
        " $p_id
    done
fi

######## BONUS #########

### Test 5 ###
if [[ $t5 == 1 || $tb == 1 ]]
then
    echo "${L_Green}[Test 5]\tGuess the movie with emojis ${NC}"

    $PATH_TO_CLIENT "
     ⛴️  +  🌊  + 💥 = ❓
     👦 +  👽  + 🚲 = ❓
     🏰 +  ❄️   + 👭 = ❓
    " $p_id
fi

### Test 6 ###
if [[ $t6 == 1 || $tb == 1 ]]
then
    echo "${L_Green}[Test 6]\tSending str with 1 000 char (10 times)${NC}"
    for i in 1 2 3 4 5 6 7 8 9 10
    do
        echo -n "${L_Green}[ ${i} ]${NC} "
        $PATH_TO_CLIENT "
        ░░░░░░░░░░░░░░░░░░░▒▓▓█████████████▓▓▒░░░░░░░░░░░░░░░░░░░░░░
        ░░░░░░░░░░░░░░▒████▓▓▒▒░▒▒▒░▒▒▒▒▒▒▓▓████▓▒░░░░░░░░░░░░░░░░░░
        ░░░░░░░░░░░▒███▓░░░░░░░░░░░░░░░░░░░░░░▒███████▓▓▒░░░░░░░░░░░
        ░░░░░░░░░▒██▓░░░░▒▒███▓▓▒░░░░░░░░░░░░░▓▓▒▒▒▒▒▓██████▓░░░░░░░
        ░░░░░░░▒██▓░░░▓███▓▒░░░░░░░░▒▒▒▒▒▒▒▒▒▒░░░░░░▒▓▓███▓████▒▒░░░
        ░░░░░░██▓░░▒▓██▓░░▒▓██████▓░░░░░░░▒░░░░░░▒██▓▒░░░▓███▒▓▒░░░░
        ░░░░░██░░▓███▒░░▒██▒░░░░▒▒██▓░░░░░░░░░░░██▒░░░░▒████▒█░░░░░░
        ░░░░██░▒▓▒▓▓░░░██░░░░░░░░░░░█▓░░░░░░░░░██░░░░░░▒███░░█▒░░░░░
        ░░░▓█░░░░░░░░░██░░░░░░░░░░░░▓█░░░░░░░░██░░░░░░░░░░░░░█▒░░░░░
        ░░░█▓░░░░░░░░░█▒░░████░░░░░░░█▒░░░░░░░██░░░░░░░░░░░░███░░░░░
        ░░▒█░░░░░░░▒▓▒█▓░▓████▓░░░░░▒█░░░░░░░░▒█▒░░░░░░░░░░██░█▒░░░░
        ░░██░░░░░▒▓▒▓▒██▒▒▓▓▓░░░░░░░██░░░░░░░░░▒████▓███████▓░█▒░░░░
        ░░█▓░░░░░▒░░░▒░▒██▓▒░░░░░▒██▓░░░░░░░░░░░░░░██▓░░░░░░▒██▓░░░░
        ░░█░░░░░░░░░▓▒░░░░▒▓██████▓░░░░░░░░░░░░░░▒██░░░▓█▓▓▒░░░██░░░
        ░▒█░░░░░░░░░░░░░░░░░░░░░░░░░░▓▒▓▒▒▒▒▒▓▓▓▓██░░▓█▓░▒▒██▒░░██░░
        ░▓█░░░░░░░░░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▓▓▒░░██░░██▓░▒░▒░██░░▒█░░
        ░██░░░░░░░░░░░░░░░░░░░░░░░▒▓▒▒▒▒▒▒▒▒░░░██░░▓█░█▓░█▒█▓█▓░░█░░
        ░██░░░░░░░░░░░░░░░░░░░░░░░░░▒▒▒▒▒░▒▒░░▓█▓░░██░█▒▒█▒█▒▓█░░█░░
        ░██░░░░░░░░░░░░░░░░░░░░░░░░▒░░░░░░░░░░▓█░░░█▒░░░░▒▒░░▒█░▓█░░
        ░▒█░░░░░░░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒░░█▒░░█▒░░░░░░░░▓█░█▓░░
        ░░█▓░▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓█░░█▒░░░░░░░░█░▒█░░░
        ░░▓█░░▒░░▒▒░░▒░░░░░░░░░░░░░░░░░░░░░░░░░░█░░█▒░░░░░░░█▓░█▓░░░
        ░░░█▒░░▒░░▒░░▒▒░░░░░░░░░░░░░░░░░░░░░░░░░█░░█▒░░░░░░▓█░░█░░░░
        ░░░██░░░▒░▒░░░▒▒░░░░░░░░░░░░░░░░░░░░░░░░█░░█▒░░░░░░██░░█░░░░
        ░░░░█▓░░░▒░▒░░░░▒▒░░░░░▒▒▒▒▒▒░░░░░░░░░░▒█░▒█░░░░░░░█▒░░█▓░░░
        ░░░░▓█░░░░▒▒░░░░░▒▒░░░░░░▒▒▒▓▓▓▒░░░░░░░██░██░░░░░░░██░░▓█░░░
        ░░░░░██░░░▒░▒░░░░░▒░░░░░░░░▒░▒▒▓█▒░░░░▒█░░█▓▒▓▓▓▒░░▓█░░░█▒░░
        ░░░░░▒█▒░░░▒▒▒░░░░▒░░░░░░░░░░▒▒▒░▒▓░░░██░▒█░░░░▒▓▓░░██░░█▒░░
        ░░░░░░▒█▒░░░▒░▒░░░▒░░░░░░▒▒▒░░░░▒▒░░░▒█░░██░░░░░░░█░▒█░░█▒░░
        ░░░░░░░▓█░░░▒░▒░░░░▒▒░░░░▓▒▒▓▓▓▒░░▓▒░██░░██▒▒▒▒▓▒▓▓███░░█▒░░
        ░░░░░░░░██░░░▒░▒░░░░░▒▒░░░░░░░░▓█▓░░░█▓░░██░▓█░█░█░░█▒░░█▒░░
        ░░░░░░░░░██░░░░▒▒░░░░░░▒▒░░░░░░░░▒█▓░█▓░░▓█▒▒█▒█░█▒██░░▒█░░░
        ░░░░░░░░░░██▒░░░░▒░░░▒░░░▒▒░░░░░░░░▒▓██░░░██░░░░▒▒██░░░██░░░
        ░░░░░░░░░░░▓██░░░░░░░░▒▒░░░▒░░░░░░░░░▓█░░░░▓███▓▓██░░░██░░░░
        ░░░░░░░░░░░░░▓██▒░░░░░░▒▒▒▒▒░░░░░░░░░░██░░░░░░▒▒▒░░░░██░░░░░
        ░░░░░░░░░░░░░░░▓███▒░░░░░░░▒▒▒▒▒▒▒▒░░░░▓██▒░░░░░░░▒███░░░░░░
        ░░░░░░░░░░░░░░░░░▒▓███▓▒░░░░░░░▒░░▒▒▒▒░░░▒██▓██████▓░░░░░░░░
        ░░░░░░░░░░░░░░░░░░░░░▒████▓▒▒░░░░░░░░░░░░░░░▓██▒░░░░░░░░░░░░
        ░░░░░░░░░░░░░░░░░░░░░░░░░▒▓████▓░░░░░░░▓█████▒░░░░░░░░░░░░░░
        ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▒█████████▒░░░░░░░░░░░░░░░░░░░
        ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▒▒▒░░░░░░░░░░░░░░░░░░░░░░░
        " $p_id
    done
fi