# � PowerShell - Estudos e Automação

![PowerShell](https://img.shields.io/badge/PowerShell-5.1%20%7C%207.x-blue?logo=powershell)
![Windows](https://img.shields.io/badge/Windows-Compatible-blue?logo=windows)
![License](https://img.shields.io/badge/License-MIT-green)

Este repositório contém materiais de estudo e exemplos práticos de PowerShell, organizados em níveis progressivos de complexidade.

## 📁 Estrutura do Projeto

### 📚 `/scripts-multiplataforma/` - Exercícios Iniciais
Exercícios de estudo e comparação entre diferentes tecnologias:
- **Batch Scripts (.bat)** - Scripts básicos para Windows
- **PowerShell (.ps1)** - Scripts intermediários 
- **Python (.py)** - Scripts para comparação
- **README.md** - Documentação comparativa detalhada

**Foco**: Aprendizado inicial, comparações e conceitos básicos.

### ⚡ `/avancado/` - Modelos de Solução
Scripts PowerShell avançados e modelos de automação:
- **gerar_html.ps1** - Geração de relatórios HTML com CSS
- **gerar_json.ps1** - Múltiplos formatos de exportação (HTML/JSON/CSV)
- **gerar_relatorio.ps1** - Script completo com timestamps e validações
- **politicas_powershell.ps1** - Gerenciamento de políticas de execução
- **/profiles/** - Configurações de perfil PowerShell
- **/saidas/** - Pasta automática para todos os relatórios gerados

**Foco**: Soluções profissionais, automação enterprise e boas práticas.

## 🎯 Progressão de Aprendizado

1. **Iniciante** → Comece em `/scripts-multiplataforma/`
   - Compare diferentes abordagens
   - Entenda os fundamentos
   - Veja as vantagens do PowerShell

2. **Avançado** → Explore `/avancado/`
   - Scripts prontos para produção
   - Padrões de código profissionais
   - Automação completa
- [x] **Perfis**: Criação e customização de perfis PowerShell
- [x] **Comparações**: PowerShell vs Batch vs Python
- [ ] **Remoting**: Gerenciamento remoto e PSSession
- [ ] **Módulos**: Criação e uso de módulos personalizados
- [ ] **DSC**: Desired State Configuration
- [ ] **Automatização**: Scripts para tarefas administrativas

## 🚀 Como Usar Este Repositório

## 🚀 Scripts Principais

| Script | Localização | Função |
|--------|-------------|---------|
| `listagem_exe.ps1` | 📁 Raiz | Lista arquivos .exe recursivamente |
| `test1.bat` a `test5.ps1` | 📁 scripts-multiplataforma | Exercícios comparativos |
| `gerar_*.ps1` | 📁 avancado | Geradores de relatório avançados |

## 📊 Recursos dos Scripts Avançados

### ✨ Funcionalidades Incluídas:
- ✅ **Geração automática de pastas**
- ✅ **Múltiplos formatos de exportação** (HTML, JSON, CSV, TXT)
- ✅ **Timestamps automáticos** nos arquivos
- ✅ **Formatação CSS** para relatórios HTML
- ✅ **Tratamento de erros** robusto
- ✅ **Validação de dependências**
- ✅ **Mensagens informativas**

### 📁 Pasta `/saidas/`
Todos os scripts avançados salvam automaticamente em:
```
/avancado/saidas/
├── relatorio.html
├── relatorio.json  
├── relatorio.csv
└── relatorio_YYYYMMDD_HHMMSS.*
```

## 🛠️ Como Usar

### Exercícios Iniciais:
```powershell
cd scripts-multiplataforma
.\test2.ps1
.\test3.ps1
```

### Scripts Avançados:
```powershell
cd avancado

# Gerar HTML simples
.\gerar_html.ps1

# Gerar múltiplos formatos
.\gerar_json.ps1 HTML
.\gerar_json.ps1 JSON
.\gerar_json.ps1 CSV

# Script completo com timestamp
.\gerar_relatorio.ps1 -Formato HTML
.\gerar_relatorio.ps1 -Formato JSON
```

## 📈 Evolução do Aprendizado

```
📚 scripts-multiplataforma/     ⚡ avancado/
├── Conceitos básicos     →    ├── Padrões profissionais
├── Comparações          →    ├── Automação completa  
├── Sintaxe simples      →    ├── Tratamento de erros
└── Exercícios          →    └── Soluções prontas
```

## 💡 Próximos Passos

- [ ] Módulos PowerShell customizados
- [ ] Integração com APIs REST
- [ ] Automação de deploy
- [ ] Monitoramento de sistema
- [ ] Análise de logs avançada

## 🔧 Requisitos

- **Windows** 10/11 ou Windows Server 2016+
- **PowerShell** 5.1+ (PowerShell 7.x recomendado)
- **Execution Policy** configurada:
  ```powershell
  Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
  ```


**🎯 Meta**: Dominar PowerShell desde conceitos básicos até automação enterprise!
- Microsoft PowerShell Team
- Todos os contribuidores deste repositório

---

<div align="center">

**🚀 Bons estudos e happy scripting! 🚀**

[![Star this repo](https://img.shields.io/badge/⭐-Star%20this%20repo-yellow?style=for-the-badge)](https://github.com/seu-usuario/powershell-estudos)
[![Follow](https://img.shields.io/badge/👤-Follow%20me-blue?style=for-the-badge)](https://github.com/seu-usuario)

</div>