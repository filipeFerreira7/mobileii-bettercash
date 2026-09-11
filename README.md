# 💰 Better Cash — Mobile II

Aplicação mobile para **gestão e controle financeiro pessoal**, desenvolvida em Flutter.

O **Better Cash** permite que o usuário registre suas receitas e despesas ao longo do mês e utilize recursos de **Inteligência Artificial** para obter análises e sugestões que possam contribuir para a melhoria da sua vida financeira.

> Projeto desenvolvido para o projeto **Better Cash — Mobile II**, com foco em arquitetura de software mobile, Design System e desenvolvimento de componentes reutilizáveis.

---

## 📌 Sobre o projeto

O Better Cash tem como objetivo centralizar o controle financeiro do usuário em uma aplicação mobile, permitindo acompanhar suas movimentações e visualizar sua situação financeira por meio de dashboards.

Entre as principais funcionalidades previstas estão:

* 👤 Gerenciamento de usuários
* 💸 Gerenciamento de despesas
* 💰 Gerenciamento de receitas
* 🤖 Análise financeira utilizando IA
* 📊 Dashboards financeiros
* 📈 Visualização de gráficos
* 📤 Exportação de dashboards com gráficos
* 📥 Importação de extratos bancários em CSV
* 🔲 Recursos relacionados a QR Code

A proposta do sistema é utilizar os dados financeiros registrados pelo usuário para gerar análises e indicar possíveis formas de melhorar o aproveitamento do seu dinheiro.

---

# 🏗️ Arquitetura

O projeto utiliza uma arquitetura baseada em:

* **MVVM — Model View ViewModel**
* **Factory Pattern**

O padrão arquitetural definido para o projeto é **MVVM por componente + Factory como fábrica única**.

A ideia é separar claramente:

```text
┌──────────────────────────────┐
│            Screen            │
│       Composição da UI       │
└──────────────┬───────────────┘
               │
               ▼
┌──────────────────────────────┐
│          Component           │
│       Renderização da UI     │
└──────────────┬───────────────┘
               │
               ▼
┌──────────────────────────────┐
│         ViewModel            │
│ Estado + regras do componente│
└──────────────┬───────────────┘
               │
               ▼
┌──────────────────────────────┐
│           Factory            │
│ Criação/configuração         │
└──────────────────────────────┘
```

### MVVM

Cada componente possui seu próprio **ViewModel**, responsável por controlar o estado e as regras relacionadas ao componente.

Por exemplo, no `ActionButtonViewModel` podem ser controlados estados como:

* `loading`
* `enabled`
* outras regras relacionadas ao comportamento do botão

Enquanto isso, o `ActionButtonComponent` permanece responsável apenas pela **renderização visual**.

### Factory

A Factory funciona como o **ponto central de criação dos componentes**.

Em vez de espalhar a criação e configuração de componentes pela aplicação, a Factory concentra essa responsabilidade.

Exemplo conceitual:

```text
ActionButtonFactory
        │
        ├── Primary
        ├── Secondary
        └── Outline
```

Isso facilita a padronização e a reutilização dos componentes.

---

# 📂 Estrutura do projeto

A estrutura definida para o projeto segue a seguinte organização:

```text
lib/
│
├── common/
│   ├── theme/
│   │   └── app_theme.dart
│   │
│   ├── routes/
│   │   └── app_routes.dart
│   │
│   └── viewmodel/
│       └── base_view_model.dart
│
├── components/
│   │
│   ├── action_button/
│   │   ├── action_button_view_model.dart
│   │   ├── action_button_component.dart
│   │   └── action_button_factory.dart
│   │
│   ├── loading/
│   │   └── ...
│   │
│   ├── tab_bar/
│   │   └── ...
│   │
│   └── list_items/
│       └── ...
│
├── screens/
│   ├── sample_screen.dart
│   ├── sample_action_button_screen.dart
│   └── sample_loading_screen.dart
│
└── main.dart
```

## 📦 Organização das responsabilidades

### `common/`

Contém recursos compartilhados pela aplicação.

#### `theme/app_theme.dart`

Centraliza os tokens visuais da aplicação, como:

* Cores
* Espaçamentos
* Tipografia
* Outros elementos do Design System

Os valores deverão ser extraídos do Figma para substituir os valores inicialmente utilizados como placeholders.

#### `routes/app_routes.dart`

Responsável pelo **gerenciamento centralizado das rotas** da aplicação.

#### `viewmodel/base_view_model.dart`

Contém a base compartilhada pelos ViewModels da aplicação.

---

# 🧩 Components

Os componentes são elementos reutilizáveis da interface.

Cada componente segue o mesmo padrão:

```text
component/
│
├── component_view_model.dart
├── component_component.dart
└── component_factory.dart
```

### Responsabilidade de cada arquivo

| Arquivo             | Responsabilidade                     |
| ------------------- | ------------------------------------ |
| `*_view_model.dart` | Estado e regras do componente        |
| `*_component.dart`  | Renderização visual                  |
| `*_factory.dart`    | Criação e configuração do componente |

### Exemplo: Action Button

```text
action_button/
│
├── action_button_view_model.dart
├── action_button_component.dart
└── action_button_factory.dart
```

#### `ActionButtonViewModel`

Controla o estado e as regras do botão.

```text
Estado
 ├── loading
 └── enabled
```

#### `ActionButtonComponent`

É um widget responsável pela apresentação visual.

> O componente deve permanecer o mais próximo possível de um widget de apresentação, evitando concentrar regras de negócio.

#### `ActionButtonFactory`

É o ponto único de criação do `ActionButton`.

Ela pode fornecer diferentes variantes:

```text
Primary
Secondary
Outline
```

---

# 🖥️ Screens

As Screens representam as telas da aplicação e são responsáveis por **compor os componentes**.

Exemplo:

```text
screens/
│
├── sample_screen.dart
├── sample_action_button_screen.dart
└── sample_loading_screen.dart
```

A `SampleScreen` funciona como um catálogo/showcase para os componentes e permite navegar entre as telas de demonstração.

---

# 🎨 Design System

O desenvolvimento visual deve seguir o Design System definido no Figma.

### UI Reference

[Free Finance UI Kit — Figma](https://www.figma.com/design/DHXVVUu3XT6Zr4BUN2isBd/Free-Finance-UI-Kit--Community---Copy-?node-id=0-1)

### Design System

[Design System — Figma](https://www.figma.com/design/rUdlsvFRq93lD2hKOrfTqL/Design-System--Community---Copy-?node-id=4-6)

O Figma deve ser utilizado como fonte de referência para:

* 🎨 Cores
* 📐 Espaçamentos
* 🔤 Tipografia
* 🔘 Componentes
* 📱 Composição das telas

A recomendação da documentação é definir primeiro os valores reais do Design System em `app_theme.dart`, evitando retrabalho visual posteriormente.

---

# 🛠️ Tecnologias

* **Flutter**
* **Dart**
* Arquitetura **MVVM**
* **Factory Pattern**
* Design System baseado em Figma

---

# 🚀 Como executar

### 1. Clone o repositório

```bash
git clone <URL_DO_REPOSITORIO>
```

### 2. Entre no diretório

```bash
cd <DIRETORIO_DO_PROJETO>
```

### 3. Instale as dependências

```bash
flutter pub get
```

### 4. Execute a aplicação

```bash
flutter run
```

---

# 🧪 Validação

Após executar o projeto, deve ser realizada uma validação rápida da aplicação, verificando principalmente:

* Inicialização correta do aplicativo
* Navegação entre as telas
* Funcionamento dos componentes
* Estados dos componentes
* Variantes do Action Button
* Aplicação correta do Design System

A documentação estabelece como etapa final um teste no emulador para verificar a navegação entre as três telas principais.

---

# 📋 Plano de desenvolvimento

O desenvolvimento recomendado segue esta ordem:

### 1. Figma

Extrair do Figma os valores reais de:

* Cores
* Espaçamentos
* Tipografia

e aplicá-los em:

```text
lib/common/theme/app_theme.dart
```

### 2. Repositório

Criar o repositório GitHub e realizar o primeiro commit contendo a estrutura inicial e este README.

### 3. Common

Finalizar:

```text
theme/
routes/
viewmodel/
```

antes de desenvolver novos componentes.

### 4. Loading

Utilizar o componente de Loading já existente e adequá-lo ao Design System.

### 5. Action Button

Validar as variantes:

```text
Primary
Secondary
Outline
```

contra o Figma.

### 6. Segundo componente

Implementar um dos componentes:

```text
Tab Bar
```

ou

```text
List Items
```

A documentação indica a possibilidade de utilização de uma Factory com uma lista de `TabItem` para o Tab Bar.

### 7. Sample Screen

Adicionar os novos componentes à tela de demonstração e configurar suas respectivas rotas.

### 8. Testes

Executar a aplicação no emulador e validar a navegação entre as telas.

### 9. Entrega

Realizar o push final do projeto e disponibilizar o link do Figma no README.

---

# 📐 Princípios arquiteturais

Para manter o projeto consistente, cada camada deve possuir uma responsabilidade clara.

### Component

> **Desenha.**

Responsável pela apresentação visual.

### ViewModel

> **Controla.**

Responsável pelo estado e pelas regras do componente.

### Factory

> **Cria.**

Responsável pela criação e configuração padronizada dos componentes.

### Screen

> **Compõe.**

Responsável por combinar componentes para formar uma tela.

Uma forma simples de lembrar:

```text
Screen
  ↓
compõe

Component
  ↓
desenha

ViewModel
  ↓
controla

Factory
  ↓
cria
```

---

# 📚 Referências

* [Free Finance UI Kit — Figma](https://www.figma.com/design/DHXVVUu3XT6Zr4BUN2isBd/Free-Finance-UI-Kit--Community---Copy-?node-id=0-1)
* [Design System — Figma](https://www.figma.com/design/rUdlsvFRq93lD2hKOrfTqL/Design-System--Community---Copy-?node-id=4-6)

---

# 👨‍💻 Projeto

**Better Cash — Mobile II**
**Idealizado e desenvolvido por: Filipe Ferreira**

Projeto desenvolvido utilizando Flutter, seguindo arquitetura **MVVM + Factory** e um Design System baseado em Figma.
