# Scripts Multiplataforma: Batch, PowerShell e Python

Este diretório contém exemplos práticos implementados em três tecnologias diferentes: Batch Scripts (.bat), PowerShell (.ps1) e Python (.py).

## 📋 Cenários de Automação

**Foco**: Demonstrar diferentes abordagens para tarefas comuns de automação e administração de sistemas.

### 📁 Arquivos Incluídos

| Arquivo | Tecnologia | Descrição | Complexidade |
|---------|------------|-----------|--------------|
| `test1.bat` | Batch Script | Script básico de sistema | Básica |
| `test1.py` | Python | Automação com Python | Básica |
| `test2.ps1` | PowerShell | Administração Windows | Intermediária |
| `test3.ps1` | PowerShell | Scripts avançados | Intermediária |
| `test4.ps1` | PowerShell | Automação de tarefas | Intermediária |
| `test5.ps1` | PowerShell | Relatórios e dados | Avançada |
| `test6.ps1` | PowerShell | Geração de HTML | Avançada |
| `styles.css` | CSS | Estilos para relatórios HTML | - |

## 🔍 Análise por Tecnologia

### 📊 Batch Scripts (.bat)
**Características:**
- ✅ Execução rápida e direta
- ✅ Compatibilidade universal Windows
- ✅ Sintaxe familiar para administradores
- ✅ Ideal para comandos sequenciais simples

**Limitações:**
- ❌ Tratamento de erro limitado
- ❌ Pouca flexibilidade para lógica complexa
- ❌ Difícil manutenção em projetos grandes

### 🔥 PowerShell (.ps1)
**Características:**
- ✅ Orientado a objetos
- ✅ Cmdlets nativos para Windows
- ✅ Tratamento robusto de erros
- ✅ Remoting e automação enterprise
- ✅ Integração profunda com Windows

**Limitações:**
- ❌ Específico do ecossistema Windows/Microsoft
- ❌ Curva de aprendizado para iniciantes
- ❌ Execution Policy pode restringir execução

### 🐍 Python (.py)
**Características:**
- ✅ Multiplataforma (Windows, Linux, macOS)
- ✅ Sintaxe clara e legível
- ✅ Vasto ecossistema de bibliotecas
- ✅ Excelente para automação e análise de dados

**Limitações:**
- ❌ Necessita instalação do Python
- ❌ Menos integrado com Windows
- ❌ Subprocess para comandos nativos

## 🎯 Guia de Escolha por Cenário

### 🔧 Use Batch quando:
- Scripts simples e rápidos para Windows
- Comandos sequenciais básicos
- Ambiente corporativo legado
- Não há necessidade de lógica complexa

### ⚡ Use PowerShell quando:
- Administração e automação Windows
- Integração com AD, Exchange, Azure
- Remoting e gerenciamento enterprise
- Relatórios e análise de dados Windows

### 🚀 Use Python quando:
- Automação multiplataforma
- Análise e processamento de dados
- Integração com APIs REST
- Machine learning e ciência de dados
- Desenvolvimento de ferramentas complexas

## 📈 Comparação de Capacidades

| Aspecto | Batch | PowerShell | Python |
|---------|-------|------------|--------|
| **Legibilidade** | ⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| **Manutenibilidade** | ⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| **Performance** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐ |
| **Portabilidade** | ⭐⭐ | ⭐⭐ | ⭐⭐⭐⭐⭐ |
| **Integração Windows** | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐ |
| **Tratamento de Erros** | ⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| **Ecossistema** | ⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |

## 🧪 Como Executar os Scripts

1. **Scripts Batch (.bat):**
   ```cmd
   test1.bat
   ```

2. **Scripts PowerShell (.ps1):**
   ```powershell
   .\test2.ps1
   .\test3.ps1
   # etc.
   ```

3. **Scripts Python (.py):**
   ```cmd
   python test1.py
   ```

## 📚 Exemplos Futuros

- [ ] **Backup automático**: Estratégias em cada linguagem
- [ ] **Monitoramento de sistema**: Coleta de métricas
- [ ] **Análise de logs**: Processamento de arquivos de log
- [ ] **APIs e web services**: Integração com serviços externos
- [ ] **Automação de deploy**: Scripts de implantação

---

**💡 Dica**: Cada tecnologia tem seu lugar. A escolha depende do contexto, requisitos e expertise da equipe!