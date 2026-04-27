# Tema 06: Gerência de Configuração
**Data:** 27/04/2026 | **Status:** Concluído

## 1. O que é Gerenciamento de Configuração (GCS)?
O software muda o tempo todo (requisito novo, bug, tecnologia q atualiza). O GCS serve pra colocar ordem no caos e controlar essas mudanças pra não quebrar o q já tá funcionando.

- **ICS (Item de Configuração de Software):** É qualquer pedaço de informação gerado no projeto. **Não é só código!** Pode ser um documento, um modelo UML ou um caso de teste.
- **Baseline (Referência):** Quando um ICS é revisado e aprovado, ele vira uma Baseline. A partir daí, vc não altera ele de qualquer jeito, precisa de um processo formal de mudança.

## 2. Gestão de Mudanças e Versões
Pra alterar uma Baseline, o fluxo ideal é:
1. Alguém abre um **FSM** (Formulário de Solicitação de Mudança).
2. O **CCM** (Comitê de Controle de Mudança) avalia o impacto e o custo.
3. Se aprovado, a galera do dev põe a mão na massa.

### Controle de Versão (SVN vs Git)
| Tipo | O que é? | Ferramentas | Exemplo de Fluxo |
| :--- | :--- | :--- | :--- |
| **Centralizado** | Tem um único servidor mestre. Vc pega o arquivo (check-out), altera e devolve (check-in). | SVN (Subversion), CVS | Se o servidor cair, ninguém commita nada. |
| **Distribuído** | Cada dev tem um clone do repositório inteiro na própria máquina. | Git, Mercurial | Vc faz *commit* local. Só manda pro servidor com *push* e puxa com *pull*. |

## 3. Construção de Sistemas (Build) e Integração Contínua (CI)
**Build** é o processo de pegar o código-fonte, juntar com as bibliotecas (libs), compilar e gerar o sistema executável (fazer tudo rodar).
- **Integração Contínua (CI):** Prática ágil de fazer builds e testes automáticos várias vezes ao dia. Se alguém fizer um commit q quebra o sistema, a equipe descobre na hora.

**Como o Build sabe o q precisa ser recompilado?**
Ele não recompila o sistema inteiro à toa, ele olha a assinatura do arquivo:
- **Timestamp:** Olha a data/hora da última modificação.
- **Checksum:** Gera um código hash do arquivo. Se mudar uma vírgula no código, o hash muda e ele recompila.

## 4. Ferramentas CASE
Automatizam o processo pra evitar erro humano. São divididas em 3 grupos:

| Categoria | Função | Ferramentas Clássicas |
| :--- | :--- | :--- |
| **Controle de Versão** | Guarda o histórico e as baselines. | Git, SVN, ClearCase |
| **Controle de Mudança** | Rastreia bugs e solicitações (tickets). | Jira, Bugzilla, Mantis |
| **Integração Contínua** | Automatiza o build e os testes. | Maven, Ant, CruiseControl |

```bash
# Exemplo de fluxo básico no Git (Distribuído)
git pull origin main # Puxa as alterações dos outros devs pro seu PC
# ... você altera o código ...
git add . # Prepara seus ICS alterados
git commit -m "fix: correção no cálculo de imposto" # Salva no seu repositório LOCAL
git push origin main # Envia pro servidor pra todo mundo ter acesso
```

## Pontos de Atenção
> **⚠️ Pegadinha de Prova (Comandos):** No **SVN**, você faz *check-out* pra pegar o arquivo e *check-in* pra devolver. No **Git**, vc faz *commit* pra salvar local e *push* pra enviar pro servidor.
> **⚠️ Erro Clássico:** Achar q controle de versão é a mesma coisa q backup. Controle de versão salva o *histórico* do "quem, quando e por que" mudou o arquivo.
> **⚠️ Definição:** Se a banca falar em "agrupamento de um conjunto de alterações candidatas a serem atualizadas", estão falando de **Commit**.

