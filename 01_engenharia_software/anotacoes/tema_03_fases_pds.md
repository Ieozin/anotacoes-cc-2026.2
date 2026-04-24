# Tema 03: Fases do Desenvolvimento de Software
**Data:** 22/04/2026 | **Status:** Concluído

## 1. Engenharia de Requisitos (O "O QUE")
É a hora de descobrir o q o sistema vai ser. Se errar aqui, o resto do projeto nasce torto.
- **O Contrato:** Tudo o q foi levantado vai pro **Documento de Requisitos**, q define o escopo do projeto.
- **Técnicas de Levantamento:**
    - **Etnografia:** Virar "sombra" do usuário pra ver como ele trabalha no dia a dia.
    - **JAD (Joint Application Design):** Reuniões intensas com geral (devs e clientes) pra decidir as coisas rápido.
    - **Brainstorming e Entrevistas:** Chuva de ideias e papo direto com o dono do problema.

## 2. Projeto / Design (O "COMO")
Aqui a gente para de falar "o q o sistema faz" e começa a desenhar "como ele faz". A abstração diminui e a técnica aumenta.

| Conceito | O que é? |
| :--- | :--- |
| **Arquitetura MVC** | Divide o app em Model (dados), View (tela) e Controller (a lógica que liga os dois). |
| **ORM** | Ferramenta q traduz as classes do código pra tabelas do banco de dados automaticamente. |

## 3. Qualidade e Testes
O foco aqui não é provar q o código tá perfeito, mas sim **achar o máximo de erro possível** antes do cliente ver.

- **Unitário:** Testa a menor parte (uma função isolada).
- **Integração:** Vê se os módulos conversam entre si sem dar pau.
- **Validação:** - **Alpha:** Teste dentro de casa (pelo time de dev).
    - **Beta:** Teste na mão do cliente real.
- **Regressão:** Rodar os testes de novo sempre q mudar algo, pra garantir q o código novo não quebrou o q já tava funcionando.

## 4. Manutenção vs Reengenharia
- **Manutenção:** Corrigir bugs ou fazer melhorias leves. É a fase mais longa e cara do ciclo de vida do software.
- **Reengenharia:** Quando o sistema tá tão "podre" ou antigo q compensa mais refazer do zero usando tecnologias novas do q tentar consertar.

## Pontos de Atenção
> **⚠️ Erro Clássico:** Achar q teste serve pra provar q não tem erro. Na real, teste só mostra q os erros conhecidos foram tratados.
> **⚠️ Estratégia (Hotfix):** Deu erro crítico em produção? A saída é o *hotfix* — corrige direto na versão atual e depois leva essa correção pro fluxo de desenvolvimento.
> **⚠️ Fatoração:** É a arte de quebrar um problema gigante em partes menores (funções/módulos) pra ficar fácil de entender e manter.
> **⚠️ Segurança vs Usabilidade:** O segredo é o equilíbrio. Muita segurança irrita o usuário, muita facilidade deixa o sistema exposto.

```python
# Exemplo de lógica de Teste Unitário (Simples)
def validar_login(user, senha):
    if user == "admin" and senha == "123":
        return True
    return False

# O teste unitário verifica essa função isolada
assert validar_login("admin", "123") == True
assert validar_login("admin", "errada") == False
```  