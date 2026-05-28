# Tema 05: Interface Gráfica com Python
**Data:** 28/05/2026 | **Status:** Concluído

## 1. O Ecossistema de GUIs (Graphical User Interface)
O desenvolvimento de interfaces gráficas em Python conta com diversas bibliotecas, cada uma focada em um cenário específico:
- **Kivy:** Focado em aplicações móveis (Android/iOS) e suporte nativo a multitoque.
- **PyQt / PySide:** Frameworks robustos e pesados, ideais para aplicações corporativas multiplataforma.
- **wxPython:** Usa os componentes nativos do sistema operacional (a tela fica com a "cara" do Windows ou do Linux, dependendo de onde roda).
- **PyAutoGUI:** Focado em automação. O script controla fisicamente o mouse e o teclado do sistema.
- **Tkinter:** É a biblioteca padrão do Python. Por já vir instalada e ter sintaxe simples, é a base acadêmica e de mercado para scripts rápidos e prototipagem RAD.

**Prós e Contras de usar GUI:**
A grande vantagem é a abstração técnica para o usuário final, tornando o sistema intuitivo. A desvantagem é o alto consumo de memória RAM, exigência de maior poder de processamento e o aumento expressivo na complexidade do código para gerenciar eventos de tela.

## 2. A Arquitetura Base do Tkinter
Toda aplicação Tkinter segue um fluxo obrigatório de 4 passos:
1. Importar a biblioteca (`import tkinter as tk`).
2. Instanciar a janela raiz (`janela = tk.Tk()`).
3. Adicionar os componentes (Widgets) e definir o layout de posicionamento (`pack()` ou `grid()`).
4. Iniciar o loop de eventos (`janela.mainloop()`). Sem o *mainloop*, a tela fecha instantaneamente e não escuta os cliques do mouse.

## 3. Principais Widgets (Componentes)
Os elementos visuais que compõem a tela possuem propriedades customizáveis (tamanho, cor, comando associado):
- **Label:** Rótulo de texto. Usado para legendas ou instruções estáticas.
- **Entry:** Caixa de texto de linha única (onde o usuário digita os dados).
- **Button:** Botão clicável. A propriedade `command` vincula o clique a uma função Python.
- **Radiobutton:** Opções de múltipla escolha onde apenas UMA pode ser selecionada.
- **Checkbutton:** Caixas de seleção independentes (o usuário pode marcar várias).
- **Combobox:** Lista suspensa (menu *drop-down*).
- **Treeview:** O componente de grade/tabela. Usado para exibir os múltiplos registros vindos do banco de dados.
- **Messagebox (Dialog):** Caixas de alerta do sistema (ex: erro, confirmação de exclusão).

## 4. Integrando GUI com Banco de Dados (CRUD Prático)
O verdadeiro poder da aplicação surge ao conectar os eventos da interface (Tkinter) aos comandos de banco de dados (PostgreSQL via `psycopg2`). 

**O Fluxo de Arquitetura:**
1. O usuário preenche os dados nos campos `Entry`.
2. O usuário clica no `Button` de "Salvar".
3. A função Python associada captura os textos com `entry.get()`.
4. Um bloco `try-except` é aberto para segurança.
5. O cursor executa o `INSERT` ou `UPDATE` usando os dados capturados como parâmetros.
6. A função dispara o `conn.commit()` para salvar no banco físico.
7. A tela é atualizada (o `Treeview` é limpo e recarregado com o `SELECT *`) para o usuário ver a alteração em tempo real.

> **⚠️ Ferramenta Auxiliar (Faker):** Durante o desenvolvimento da GUI, testar o preenchimento de telas vazias é improdutivo. A biblioteca `faker` gera dados de teste realistas e aleatórios (nomes, preços, e-mails) em massa para preencher o banco automaticamente durante a homologação.