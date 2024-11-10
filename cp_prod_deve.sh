#!/bin/bash
## Scritp para copiar arquivos do storage-prod para storage-deve
# Uso ./cp_prod_deve.sh arquivo_lista.txt entidade_destino
if [ "$#" -ne 2 ]; then
    echo "Uso: $0 <arquivo_lista> <entidade>"
    exit 1
fi

lista=$1
entidade_destino=$2

# O script vai ler a lista com os paths dos arquivos, e para cada linha de arquivo.
# será feito um scp para o storage destino, no path especificado.
# Gerando logs referente a transferencias com sucesso e erros caso exista.
while read -r caminho_arquivo; do
caminho_arquivo=$(echo "$caminho_arquivo" | tr -s ' ' | xargs)
    if [ -e "$caminho_arquivo" ]; then
        scp "$caminho_arquivo" 192.168.0.20:/storage/deve/br/com/meustie/"$entidade_destino"/meusistema/contratos/ >> log_scp_prod_deve.log 2>&1
        if [ $? -eq 0 ]; then
            echo "Arquivo transferido com sucesso: $caminho_arquivo" >> sucesso.log
        else
            echo "Falha na transferência: $caminho_arquivo" >> falha_transferencia.log
        fi
    else
        echo "Arquivo não encontrado: $caminho_arquivo" >> nao_encontrado.log
    fi
done < "$lista"

# PAZ
