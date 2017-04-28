########################################
# En este archivo se encuentran
# utilidades para hacer prints de colores
########################################

# DEFINIMOS LAS VARIABLES NECESARIAS

# Reset
NC='\033[0m'       # Text Reset, no color
# Colores típicos
BLACK='\033[0;30m'        # Black
RED='\033[0;31m'          # Red
GREEN='\033[0;32m'        # Green
YELLOW='\033[0;33m'       # Yellow
BLUE='\033[0;34m'         # Blue
PURPLE='\033[0;35m'       # Purple
CYAN='\033[0;36m'         # Cyan
WHITE='\033[0;37m'        # White

########################################
# Funciones para hacer prints de colores
# ejemplo de uso:
# printRed "Texto a imprimir"
########################################

printBlack() {
    printf "${BLACK}${1}${NC}"
}

printRed() {
    printf "${RED}${1}${NC}"
}

printGreen() {
    printf "${GREEN}${1}${NC}"
}

printYellow() {
    printf "${YELLOW}${1}${NC}"
}

printBlue() {
    printf "${BLUE}${1}${NC}"
}

printPurple() {
    printf "${PURPLE}${1}${NC}"
}

printCyan() {
    printf "${CYAN}${1}${NC}"
}

printWhite() {
    printf "${WHITE}${1}${NC}"
}
