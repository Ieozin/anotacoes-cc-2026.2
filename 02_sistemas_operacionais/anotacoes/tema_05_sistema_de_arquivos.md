# Tema 05: Sistema de Arquivos
**Data:** 11/05/2026 | **Status:** Concluído

## 1. O básico sobre Arquivos e Diretórios
O Sistema de Arquivos é o q garante a persistência dos dados (pra vc não perder tudo quando desliga o PC). No Linux, existe o **VFS (Virtual File System)**, q é uma camada de abstração pra vc acessar um pendrive (FAT32), um HD (ext4) ou a rede do mesmo jeito.

**Objetos do VFS no Linux:**
- **I-node:** A "identidade" do arquivo. Guarda as permissões, tamanho e onde os blocos estão no disco. (O nome do arquivo não fica aqui!).
- **Arquivo:** O arquivo aberto em si por um processo.
- **Dentry:** A entrada de diretório (ex: o caminho `/home/maria/teste.txt` tem 4 dentries: `/`, `home`, `maria` e `teste.txt`).
- **Superbloco:** Informações gerais do sistema de arquivos inteiro (tamanho, blocos livres).

## 2. Métodos de Alocação (Como o disco guarda os dados)
O disco é dividido em blocos. O SO precisa saber como ligar os blocos de um mesmo arquivo.

| Método | Como funciona? | Prós / Contras |
| :--- | :--- | :--- |
| **Contígua** | Arquivo fica em blocos em sequência (ex: CD-ROM). | **Pró:** Leitura super rápida. **Contra:** Gera muita fragmentação externa (buracos no disco). |
| **Lista Encadeada** | Um bloco aponta pro próximo. O diretório só guarda o 1º. | **Pró:** Zero fragmentação externa. **Contra:** Acesso aleatório lento (tem q ler a corrente toda). |
| **Encadeada c/ Índice (FAT)** | Tira o ponteiro do bloco e joga tudo numa tabela na RAM. | **Pró:** Acesso mais rápido. **Contra:** A tabela FAT gasta muita RAM em discos gigantes. |
| **I-nodes (Indexada)** | Cada arquivo tem uma tabelinha própria q guarda o endereço de todos os seus blocos. | **O Rei (usado no Linux):** Só carrega o i-node na RAM quando o arquivo é aberto. Permite blocos indiretos pra arquivos gigantes. |

## 3. Estrutura do Linux (Ext2/Ext3 e Árvore)
No Linux não tem "Disco C:" e "Disco D:". Tudo é montado (`mount`) embaixo de uma única raiz (`/`).

**Principais Diretórios:**
- `/bin` e `/sbin`: Executáveis essenciais.
- `/etc`: Configurações.
- `/dev`: Dispositivos de hardware (ex: `/dev/sda1` é a partição 1 do disco A).
- `/home`: Pasta dos usuários.
- `/tmp`: Lixo temporário.

**Evolução do Ext:**
- **Ext2:** O basicão. Se faltar luz, o fsck demora horas arrumando o disco corrompido.
- **Ext3/Ext4 (Journaling):** A revolução. Ele anota o q vai fazer num "diário" (*journal*) antes de gravar no disco. Faltou luz? Ele lê o diário e termina a transação. Não corrompe fácil.

## 4. Comandos e Links (Hard vs Soft)
O comando mais confuso é o `ln`, q cria links (atalhos). Tem dois tipos:
- **Link Simbólico (Softlink - `ln -s`):** É o atalho do Windows. Aponta pro *caminho* do arquivo. Se apagar o original, o link quebra.
- **Hardlink (`ln`):** Aponta direto pro **mesmo I-node**. Se alterar um, altera o outro. Se apagar o original, o hardlink continua funcionando (o arquivo só é deletado do disco quando a contagem de hardlinks chegar a zero).

```bash
# Navegação e manipulação
pwd                # Onde eu tô?
ls -lh             # Lista arquivos com tamanho "humano" (KB, MB)
mkdir -p a/b/c     # Cria a árvore inteira de pastas de uma vez
rm -rf pasta/      # Apaga diretório cheio (cuidado com isso aqui)
cp -r origem/ dest/ # Copia pasta inteira
cat arquivo.txt    # Lê o arquivo no terminal
find / -name "*.c" # Procura arquivos .c a partir da raiz

# Gerenciando discos
df -h              # Mostra o espaço livre no HD
lsblk              # Lista as partições e os discos físicos montados

```

## 5. Editores de Texto

Saber usar editor no terminal salva a vida se o ambiente gráfico der pau.

| Editor | Como é? | Comandos Chave |
| --- | --- | --- |
| **Nano** | Simples e direto. Tem um menu embaixo pra ajudar. | `<CTRL>+O` (Salvar) / `<CTRL>+X` (Sair) |
| **Vim** | O monstro. É "Modal" (Modo Inserção e Modo Comando). | `i` (Insere), `<ESC>` (Volta pro comando), `dd` (apaga linha), `:wq` (salva e sai). |
| **Gedit** | Editor de interface gráfica (tipo o Bloco de Notas do GNOME). | N/A (Usa mouse normal). |

## Pontos de Atenção

> **⚠️ Pegadinha de Prova (Cache de Disco):** Tem dois tipos de cache pra escrita em disco:
> * **Write-through:** Grava no cache e no disco *ao mesmo tempo*. É seguro, mas o desempenho é horrível.
> * **Write-back:** Grava só no cache e devolve o controle pro processo. O SO grava no disco depois. Muito rápido, mas se faltar luz, perde dado.

> **⚠️ Erro Clássico (Superbloco):** Se a banca perguntar o que guarda o tamanho do sistema de arquivos e blocos livres, é o **Superbloco**. O *I-node* guarda os atributos só do *arquivo específico*.
> **⚠️ Regra do Hardlink:** Vc NÃO pode criar hardlink apontando pra um diretório (só o próprio SO pode). E não dá pra fazer hardlink entre partições diferentes (porque os números de i-nodes são únicos só dentro da própria partição).

