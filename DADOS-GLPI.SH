#!/bin/bash
# -------------------------------------------------------------------------
# @Programa
#   @name: InstitutopolisGLPiBKP.sh
#   @versao: 1.0.2
#   @Data 27 de Janeiro de 2023
#   @Copyright: Polis Instituto departmanto de TI, 2014- 2023
# --------------------------------------------------------------------------
# LICENSE
#
# InstitutopolisGLPiBKP.sh is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version.
#
# InstitutopolisGLPiBKP.sh is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# If not, see <http://www.gnu.org/licenses/>.
# --------------------------------------------------------------------------
#
# Declaracao de variaveis do programa
# * altere as informacoes abaixo de
# acordo com as caracteristicas do seu sistema
#
# Diretorio de Backup
#BKPDIR="/var/www/html/glpi/files/_dumps"
# Diretorio de Backup
BKPDIR="/home/suporte/DADOS_GLPI"
# Diretorio de Origem 
ORDIR="/var/www/html/glpi"
# Diretotio dos scripts em  .sh
DIRSH="/usr/local/bin"
# Periodo de retencao do backup em dias
RETENCAO=7
 ##############################
# Evite alterar a partir daqui #
 ##############################

# Data de execucao cópia
DATE=$(date +%Y%m%d_%H_%M)
#
# Inicio do Backup
# Copiando os arquivos
cp -R -f -p $ORDIR $BKPDIR
# Copiando arquivos de configuraçãoes 
cp -R -f -p $DIRSH $BKDIR
# Abrindo o diretório
cd $BKPDIR
# Compactando o arquivo para que não fique muito grande
tar -czvf DADOS-GLPI.$DATE.tar.gz $ORDIR
# Removendo arquivos com mais de 7 dias
find  *.tar.gz -ctime +$RETENCAO -exec rm -rf {} \;
# Removendo o backup da instalação completa anterior
rm -R -f  glpi
# Validando se o DUMP foi bem sucedido
#
if [ $? -ne 0 ]
then
    # Caso o DUMP falhe, o script aborta a execucao
    echo "Erro ao executar Backup de $ORDIR"
    exit 1
else
    # Excluindo arquivos mais antigos que o periodo de retencao
    echo "Excluindo arquivos mais antigos!"
    find $BKPDIR/* -type f -mtime +$RETENCAO -exec rm -rf {} \;
fi
