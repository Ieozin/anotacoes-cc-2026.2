# Tema 06: Automatizando Tarefas no Linux
**Data:** 12/05/2026 | **Status:** Concluído

## 1. CRON (O Agendador de Tarefas)
O CRON é o serviço q roda scripts de forma automática no Linux (tipo o Agendador de Tarefas do Windows). Ele é **multiusuário** (cada usuário tem o seu).

- **Comando pra editar:** `crontab -e`
- **Sintaxe do Crontab:** Tem 5 campos de tempo + o comando q vai rodar.
  `[Minuto] [Hora] [Dia do Mês] [Mês] [Dia da Semana] /caminho/do/comando`
  - *Máscaras:* `*` (Qualquer), `,` (E), `-` (Até), `/` (A cada. Ex: `*/2` a cada 2 horas).
  - *Dia da Semana:* 0 é Domingo, 1 é Segunda...

```bash
# Exemplo no crontab: Rodar um backup toda sexta-feira (5) às 23:30
30 23 * * 5 tar -cfz /tmp/backup.tar.gz /home/leonardo

# Redirecionando a saída (já q o cron roda em background e não tem tela)
00 12 * * * /scripts/limpeza.sh >> /var/log/limpeza.log
```

## 2. O Básico de Shell Script

Um script é só um arquivo de texto cheio de comandos q o shell executa de cima pra baixo.

1. **A Palavra Mágica (Shebang):** A 1ª linha tem q ser `#!/bin/bash` pro SO saber quem vai interpretar o arquivo.
2. **Permissão:** Criou o arquivo? Tem q dar permissão de execução com `chmod u+x script.sh`.
3. **Execução:** Tem q passar o caminho (mesmo q seja a pasta atual): `./script.sh`.

### Comandos Úteis no Script

* `sleep 5`: Pausa por 5 segundos.
* `read VAR`: Pausa e espera o usuário digitar algo e dar Enter (salva na variável VAR).
* `exit 0`: Termina o script com sucesso. Qualquer valor de 1 a 255 indica erro.

## 3. Variáveis e Condicionais (IF)

* **Criando Variável:** `VAR="Linux"` (NÃO pode ter espaço antes nem depois do `=` !).
* **Lendo Variável:** Tem q usar o `$`. Ex: `echo "$VAR"`.
* **Lendo saída de comando:** `DATA=$(date +%T)` (Joga a resposta do date pra variável).
* **Parâmetros:** Quando vc roda `./script.sh 10 20`, o `10` fica na variável `$1` e o `20` na `$2`. O `$0` é o nome do script.

### O temido `if` no Bash

A sintaxe é chata. Os comparadores de NÚMERO são diferentes dos de TEXTO.

| O que testar | Número (Ex: `$A -eq $B`) | Texto (Ex: `"$A" = "$B"`) |
| --- | --- | --- |
| **Igual** | `-eq` (equal) | `=` |
| **Diferente** | `-ne` (not equal) | `!=` |
| **Maior que** | `-gt` (greater than) | N/A |
| **Menor que** | `-lt` (less than) | N/A |
| **Maior ou igual** | `-ge` | N/A |
| **Vazio / Nulo** | N/A | `-z` (zero) ou `-n` (não-nulo) |

```bash
if [[ "$1" -eq 10 ]]; then
    echo "O parâmetro 1 é igual a dez"
else
    echo "Diferente de dez"
fi
```

## 4. Matemática e Loops

O Shell só sabe fazer conta com **número inteiro**.

* Conta simples: `(( C = A + B ))` ou `echo $(( A + B ))`. Incrementar: `(( i++ ))`.
* Conta com decimal (ponto flutuante): Tem q chamar a calculadora `bc`. Ex: `echo "scale=2; 10/3" | bc` (Retorna 3.33).

### Loops (WHILE e FOR)

```bash
# WHILE (Roda enquanto a condição for verdadeira)
i=1
while [[ $i -le 10 ]]; do
    echo "Contando $i"
    (( i++ ))
    # break: quebra o loop na força | continue: pula pra próxima volta
done

# FOR (Roda pra cada item de uma lista)
for arquivo in *; do
    echo "Achei o arquivo: $arquivo"
done
```

## Pontos de Atenção

> **⚠️ Pegadinha de Prova (CRON e Sudo):** NUNCA use `sudo` dentro de um script agendado no Crontab do seu usuário. O Cron roda em background e não tem como você digitar a senha. O script vai ficar travado pra sempre. Se precisa de root, agende no crontab do root (`/etc/crontab`).
> **⚠️ Erro Clássico (Espaço em Variável):** No Bash, `A=1` cria uma variável. `A = 1` vai dar erro de "comando A não encontrado", pq o Bash acha que vc tá tentando rodar um programa chamado A passando os parâmetros "=" e "1".
> **⚠️ Pegadinha de Prova (Comparadores):** Usar `=` pra comparar números ou `-eq` pra comparar textos dá merda. Decore as siglas em inglês pros números (`eq`, `ne`, `gt`, `lt`).

