# Documentação dos Scripts
## cp_prod_deve.sh
#!/bin/bash
## Scritp para copiar arquivos do storage-prod para storage-deve.
Uso ./cp_prod_deve.sh arquivo_lista.txt entidade_destin .
O script vai ler a lista com os paths dos arquivos, e para cada linha de arquivo,
será feito um scp para o storage destino, no path especificado.
Gerando logs referente a transferencias com sucesso e erros caso exista.
PAZ

---

