# Tema 05: Qualidade de Software
**Data:** 24/04/2026 | **Status:** Concluído

## 1. A Base: Processo vs Produto
Aqui entramos no nosso território de QA. A Qualidade garante q o sistema atende as expectativas do cliente e não explode em produção. Ela é dividida em duas dimensões:
- **Qualidade de Processo:** Foca em melhorar as *etapas* de desenvolvimento (pra não propagar erro pras próximas fases).
- **Qualidade de Produto:** Foca no *software final* (testes dinâmicos e validações).

### Custos da Qualidade
A qualidade custa dinheiro, mas a falta dela custa muito mais.
| Tipo | O que é? | Exemplos |
| :--- | :--- | :--- |
| **Conformidade (Prevenção)** | Grana gasta pra evitar q o erro aconteça. | Treinamento, planejamento de testes, revisões de código. |
| **Não Conformidade (Falha)** | Grana gasta pq o sistema deu pau. | Retrabalho, atraso de cronograma, cliente processando a empresa. |

## 2. Garantia da Qualidade (SQA)
O time de SQA foca em processos, métricas e padrões.
- **ISO 9000:** Focado no *Processo* (gestão organizacional).
- **ISO 9126:** Focado no *Produto*. Define 6 atributos: Funcionalidade, Confiabilidade, Usabilidade, Eficiência, Manutenibilidade e Portabilidade.

## 3. Testes: Verificação vs Validação
Isso aqui é a espinha dorsal de SQA na matéria, dividido no formato de "U".

| Tipo | Foco | O que faz? | Exemplos |
| :--- | :--- | :--- | :--- |
| **Verificação** | Processo (Estático) | Avalia artefatos e documentos *antes* de rodar código. | Revisões de documentos e Auditorias. |
| **Validação** | Produto (Dinâmico) | Roda o sistema de fato pra achar quebra. | Teste Unitário, Integração, Sistema, Aceite (Alpha e Beta). |

### Testes de Sistema (Foco na Infra/Ambiente)
- **Recuperação:** Força um erro (tipo puxar a tomada) pra ver se o sistema volta rápido e sem corromper dados.
- **Segurança:** Tenta invadir e quebrar sigilo.
- **Esforço (Stress):** Simula pico de uso irreal pra ver onde o sistema "grita".
- **Desempenho:** Testa o tempo de resposta em cenários de pico previstos.

## 4. Medições e Métricas
"Não se controla o que não se mede."
- **Medida:** Um dado bruto (Ex: 5 bugs encontrados).
- **Métrica:** Uma medida comparada/calculada para tirar conclusões (Ex: 5 bugs por cada 100 linhas de código).
- **Método GQM:** Goal (Objetivo) -> Question (Perguntas p/ atingir o objetivo) -> Metric (O que vou medir pra responder as perguntas).

```python
# Exemplo de Métricas Estáticas (Analisando o código sem rodar)

def processa_pagamento(valor, tipo_cliente):
    # Fan-in: Quantos outros métodos chamam essa função? (Se for muito alto, a função é super crítica)
    # Fan-out: Quantas funções diferentes essa função chama por dentro?
    
    # Complexidade Ciclomática: Conta quantos caminhos independentes o código tem.
    if tipo_cliente == "VIP": # Caminho 1
        return valor * 0.9
    elif tipo_cliente == "NOVO": # Caminho 2
        return valor * 0.95
    return valor # Caminho 3

# Quanto maior a complexidade ciclomática, mais chato e arriscado é de dar manutenção.
```

## Pontos de Atenção
> **⚠️ Pegadinha de Prova (Vocabulário de Bug):** > - **Erro:** A cagada do dev (lapso humano).
> - **Defeito:** A anomalia dentro do código (consequência do erro).
> - **Falha:** O sistema quebrando na mão do usuário (consequência do defeito).
>
> **⚠️ Pegadinha de Prova (Complexidade):** Falou na prova sobre "medir caminhos linearmente independentes" ou "complexidade estrutural do código", a resposta é **Complexidade Ciclomática**.
> 
> **⚠️ Conceito Clássico:** Teste **Alpha** é no ambiente do dev (controlado). Teste **Beta** é na instalação do cliente (mato alto, sem controle).

