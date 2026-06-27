# Revisão de Prova: Engenharia de Software

**Data:** 26/06/2026 | **Status:** Resumo para estudo

## 1. O que é Engenharia de Software

Engenharia de Software é a área que organiza o desenvolvimento de software usando processos, métodos, ferramentas e controle de qualidade.

A ideia é evitar que o software seja feito de qualquer jeito.

Ela ajuda a criar sistemas:

- mais confiáveis;
- mais fáceis de manter;
- mais próximos do que o usuário precisa;
- com menos erros;
- com melhor controle de prazo, custo e qualidade.

Software não é parte física do computador. Software é o conjunto de programas, dados e instruções que fazem o computador executar tarefas.

Resumo:

```txt
hardware → parte física
software → programas, dados e instruções
```

## 2. Engenharia de Software em camadas

A Engenharia de Software pode ser vista como uma tecnologia em camadas.

As principais camadas cobradas foram:

| Camada | Ideia |
| :--- | :--- |
| Qualidade | Base para garantir que o software atenda expectativas e requisitos |
| Processo | Define as etapas do desenvolvimento |
| Métodos | Define técnicas, modelos e artefatos usados no projeto |
| Ferramentas | Apoiam a execução dos métodos e processos |

Exemplo:

```txt
qualidade → preocupação geral
processo → etapas
métodos → técnicas e modelos
ferramentas → apoio automatizado
```

A camada de métodos pode gerar artefatos como:

- modelo de casos de uso;
- modelo de classes;
- diagramas;
- especificações.

## 3. Requisitos

Levantamento de requisitos é uma das primeiras etapas do desenvolvimento.

O objetivo é entender o que o sistema precisa fazer e quais problemas ele deve resolver.

Técnicas comuns:

- entrevistas;
- questionários;
- observação;
- reuniões com usuários;
- análise de documentos.

O foco é melhorar a comunicação com o usuário e evitar construir um sistema que não atende à necessidade real.

Resumo:

```txt
levantamento de requisitos → entender o que o sistema deve fazer
```

## 4. Processo de desenvolvimento

O processo organiza o ciclo de vida do software.

Alguns modelos importantes:

### Cascata

Modelo mais sequencial.

A ideia é passar por etapas em ordem:

```txt
requisitos → análise/projeto → implementação → testes → implantação
```

Tem menos flexibilidade para mudanças depois que uma fase avança.

### Incremental

Entrega o sistema em partes.

Cada incremento entrega um subconjunto de funcionalidades.

```txt
entrega 1 → entrega 2 → entrega 3
```

Bom quando é possível priorizar funcionalidades e entregar valor aos poucos.

### Espiral

Modelo baseado em ciclos e análise de riscos.

Cada volta da espiral representa uma fase/ciclo do processo.

Ponto principal:

```txt
espiral → foco forte em riscos
```

### RAD

RAD significa desenvolvimento rápido de aplicação.

É um modelo incremental com foco em ciclos curtos e construção rápida, muitas vezes usando componentes e protótipos.

Resumo:

| Modelo | Ideia principal |
| :--- | :--- |
| Cascata | Sequencial |
| Incremental | Entregas em partes |
| Espiral | Ciclos com análise de riscos |
| RAD | Desenvolvimento rápido |
| Scrum | Iterativo, ágil e adaptativo |

## 5. Processo Unificado

No Processo Unificado, o desenvolvimento é dividido em fases.

Fases principais:

| Fase | Ideia |
| :--- | :--- |
| Iniciação | Define visão geral, escopo e viabilidade |
| Elaboração | Define a base arquitetural e trata riscos principais |
| Construção | Implementa o sistema |
| Transição | Entrega o sistema ao usuário |

A fase de **Elaboração** tem como ponto central estabelecer a arquitetura base do sistema.

Resumo:

```txt
Elaboração → arquitetura base
Construção → implementação
Transição → entrega
```

## 6. Scrum

Scrum é uma metodologia ágil com ciclos curtos e adaptativos.

Esses ciclos geralmente são chamados de sprints.

Papéis principais:

| Papel | Função |
| :--- | :--- |
| Product Owner | Cuida do produto, backlog e prioridades |
| Scrum Master | Remove impedimentos e facilita o processo |
| Time de desenvolvimento | Constrói o produto |

O Scrum Master não é “chefe técnico”. O papel dele é facilitar o trabalho, ajudar a equipe a seguir o processo e remover obstáculos.

Resumo:

```txt
Scrum Master → remove impedimentos
Product Owner → prioriza o produto
Time → desenvolve
```

## 7. PMBOK e gerenciamento de projeto

O PMBOK organiza áreas de conhecimento para gerenciamento de projetos.

No gerenciamento de tempo/cronograma, entram atividades como:

- definir atividades;
- sequenciar atividades;
- estimar recursos;
- estimar duração;
- desenvolver cronograma;
- controlar cronograma.

Resumo:

```txt
tempo/cronograma → atividades e prazos
escopo → o que será entregue
custo → orçamento
qualidade → padrões e conformidade
riscos → incertezas do projeto
```

## 8. Gerenciamento de riscos

Gerenciamento de riscos é o processo de identificar, analisar e responder a riscos do projeto.

Sequência cobrada:

```txt
identificação de riscos
→ análise qualitativa
→ análise quantitativa
→ planejamento de respostas
```

Explicando:

| Etapa | Ideia |
| :--- | :--- |
| Identificação | Descobrir quais riscos existem |
| Análise qualitativa | Priorizar riscos por impacto/probabilidade |
| Análise quantitativa | Medir numericamente impacto, quando necessário |
| Respostas | Planejar o que fazer com cada risco |

## 9. Qualidade de software

Qualidade de software é o quanto o sistema atende bem aos requisitos e expectativas.

No contexto da ISO 9126, alguns atributos importantes são:

| Atributo | Ideia |
| :--- | :--- |
| Funcionalidade | Atende às funções esperadas |
| Confiabilidade | Funciona corretamente ao longo do tempo |
| Usabilidade | É fácil de aprender e usar |
| Eficiência | Usa bem recursos como tempo e memória |
| Manutenibilidade | É fácil de corrigir e evoluir |
| Portabilidade | Pode ser adaptado para outros ambientes |

Ponto importante:

```txt
portabilidade não é atender requisito funcional
portabilidade é adaptar para outro ambiente
```

## 10. Usabilidade

Usabilidade mede o quanto o software é fácil de aprender, usar e entender.

Uma métrica importante é o tempo de treinamento necessário para novos usuários.

Se o usuário precisa de muito treinamento para usar o sistema, a usabilidade provavelmente está ruim.

Usabilidade envolve:

- facilidade de aprendizado;
- facilidade de uso;
- baixa taxa de erro;
- satisfação do usuário;
- eficiência na execução de tarefas.

## 11. Testes

Testes servem para verificar se o software funciona como deveria.

Na fase de testes, a equipe busca validar se o sistema está aderente aos requisitos definidos.

Principais objetivos:

- encontrar defeitos;
- verificar funcionalidades;
- testar integração;
- validar comportamento esperado;
- aumentar confiança na entrega.

Resumo:

```txt
testes → validar aderência aos requisitos e encontrar defeitos
```

Quando um defeito é encontrado em produção, a correção deve ser rápida. O ideal é corrigir a versão atual e liberar a correção, sem esperar apenas uma versão futura.

## 12. Refatoração e decomposição

Refatoração é melhorar a estrutura interna do código sem alterar seu comportamento externo.

Exemplo:

```txt
antes → código confuso, repetido, difícil de manter
depois → código mais claro, organizado e fácil de alterar
```

A fatoração/decomposição ajuda a dividir um problema em partes menores.

Isso reduz complexidade e facilita manutenção.

Resumo:

```txt
refatorar → mudar por dentro sem mudar o comportamento externo
decompor → dividir problema em partes menores
```

## 13. Segurança e usabilidade

Em funções como login, o sistema precisa equilibrar segurança e usabilidade.

Uma boa abordagem é usar autenticação multifatorial, mas sem tornar o uso inviável.

Exemplo:

```txt
senha + biometria
senha + código temporário
senha + confirmação no app
```

Cuidado:

- senha simples sozinha é fraca;
- segurança sem usabilidade pode atrapalhar o uso real;
- não é ideal remover autenticação forte só para simplificar.

## 14. Ferramentas CASE

CASE significa ferramentas de apoio à Engenharia de Software.

Elas ajudam no processo de desenvolvimento.

Podem apoiar:

- modelagem;
- documentação;
- geração de código;
- análise;
- manutenção;
- controle de artefatos.

Principal benefício:

```txt
aumentar eficiência e reduzir erros
```

Ferramentas CASE não eliminam a necessidade de testes.

## 15. Gerência de Configuração de Software

Gerência de configuração controla mudanças no software e nos artefatos do projeto.

Ela ajuda a manter estabilidade enquanto o sistema evolui.

Envolve:

- identificar artefatos;
- controlar versões;
- controlar mudanças;
- registrar histórico;
- manter rastreabilidade;
- apoiar integração contínua.

Resumo:

```txt
gerência de configuração → controlar versões, mudanças e artefatos
```

### Controle de versão

Identifica em qual versão está o software e quais características existem em cada versão.

Exemplo:

```txt
v1.0
v1.1
v2.0
```

### Controle de mudanças

Registra quais mudanças foram feitas, por quem, quando e por quê.

### Integração contínua

Testa e integra mudanças com frequência, assim que elas são realizadas.

Resumo:

| Nível | Função |
| :--- | :--- |
| Controle de versão | Identifica versões |
| Controle de mudanças | Registra alterações |
| Integração contínua | Testa/integra mudanças frequentemente |

## 16. Plano de gerenciamento de configuração

Um plano de gerenciamento de configuração deve definir como os itens do projeto serão controlados.

Ele deve tratar pontos como:

- o que será gerenciado;
- como os itens serão identificados;
- ferramentas usadas;
- processos de uso;
- responsabilidades;
- registros das informações de configuração;
- políticas de controle de mudanças.

Se o plano não define o que será gerenciado ou ignora políticas de mudança, fica incompleto.

## 17. Padrões e normas

Algumas normas e padrões importantes:

| Padrão | Uso |
| :--- | :--- |
| ISO 9001 | Gestão da qualidade |
| IEEE 830 | Especificação de requisitos de software |
| ISO/IEC 27001 | Segurança da informação |
| ITIL | Gestão de serviços de TI |

Para qualidade em processos de desenvolvimento, a referência cobrada foi:

```txt
ISO 9001
```

## 18. Resumo final pra revisar

Antes da prova, lembrar:

- software é programa + dados + instruções;
- Engenharia de Software organiza o desenvolvimento;
- qualidade é a base da Engenharia de Software;
- processo define etapas;
- métodos definem técnicas e artefatos;
- levantamento de requisitos vem no início;
- cascata é sequencial;
- incremental entrega em partes;
- espiral foca riscos;
- RAD foca desenvolvimento rápido;
- no Processo Unificado, Elaboração define a arquitetura base;
- Scrum trabalha com ciclos curtos;
- Scrum Master remove impedimentos;
- PMBOK cronograma envolve atividades e prazos;
- riscos seguem identificação, análise qualitativa, análise quantitativa e respostas;
- testes validam aderência aos requisitos;
- refatoração melhora o código sem mudar comportamento externo;
- usabilidade pode ser medida pelo tempo de treinamento;
- CASE aumenta eficiência e reduz erros;
- gerência de configuração controla versões, mudanças e artefatos;
- ISO 9001 está ligada à gestão da qualidade.
