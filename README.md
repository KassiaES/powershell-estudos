# 📘 PowerShell - Repositório de Estudos

![PowerShell](https://img.shields.io/badge/PowerShell-5.1%20%7C%207.x-blue?logo=powershell)
![Windows](https://img.shields.io/badge/Windows-Compatible-blue?logo=windows)
![License](https://img.shields.io/badge/License-MIT-green)

Um repositório completo para aprender PowerShell do básico ao avançado, com exemplos práticos, comparações com outras linguagens e guias de referência.

## 📁 Estrutura do Repositório

```
powershell-estudos/
├── 📂 basico/
│   ├── conceitos-fundamentais.md
│   ├── comandos-essenciais.ps1
│   └── primeiros-passos.md
├── 📂 intermediario/
│   ├── funcoes-personalizadas.ps1
│   ├── gerenciamento-servicos.ps1
│   └── manipulacao-arquivos.ps1
├── 📂 avancado/
│   ├── politicas-powershell.ps1
│   ├── profiles/
│   │   ├── criar-perfil.txt
│   │   └── criar-perfil.ps1
│   └── remoting-e-automation.ps1
├── 📂 exemplos-praticos/
│   ├── batch-vs-powershell/
│   │   ├── test1.bat
│   │   ├── test2.ps1
│   │   └── test1.py
│   ├── administracao-sistema/
│   └── scripts-utilitarios/
├── 📂 comparacoes/
│   ├── powershell-vs-python.md
│   ├── powershell-vs-bash.md
│   └── cmdlets-vs-comandos.md
├── 📂 referencias/
│   ├── cheat-sheet.md
│   ├── troubleshooting.md
│   └── recursos-extras.md
├── README.md
└── LICENSE
```

## 🎯 Objetivos de Aprendizagem

- [x] **Fundamentos**: Cmdlets, pipeline, objetos
- [x] **Administração**: Serviços, processos, registro
- [x] **Políticas**: Execution Policy, Group Policy, Security
- [x] **Perfis**: Criação e customização de perfis PowerShell
- [x] **Comparações**: PowerShell vs Batch vs Python
- [ ] **Remoting**: Gerenciamento remoto e PSSession
- [ ] **Módulos**: Criação e uso de módulos personalizados
- [ ] **DSC**: Desired State Configuration
- [ ] **Automatização**: Scripts para tarefas administrativas

## 🚀 Como Usar Este Repositório

### Para Iniciantes
1. Comece pela pasta `basico/`
2. Execute os exemplos em `exemplos-praticos/`
3. Use o `cheat-sheet.md` como referência

### Para Usuários Intermediários
1. Explore a pasta `intermediario/`
2. Estude as comparações em `comparacoes/`
3. Implemente os scripts de `administracao-sistema/`

### Para Usuários Avançados
1. Aprofunde-se na pasta `avancado/`
2. Customize seus perfis usando `profiles/`
3. Contribua com novos exemplos

## 📋 Conteúdo Disponível

### ✅ Já Implementado

| Arquivo | Descrição | Nível |
|---------|-----------|-------|
| `test1.bat` | Script batch original | Básico |
| `test2.ps1` | Equivalente PowerShell do batch | Intermediário |
| `test1.py` | Versão Python para comparação | Intermediário |
| `politicas-powershell.ps1` | Guia completo de políticas | Avançado |
| `criar-perfil.txt` | Documentação de perfis | Intermediário |
| `criar-perfil.ps1` | Script para criar perfis | Avançado |

### 🔄 Em Desenvolvimento

- [ ] **Módulo de Logs**: Funções para manipulação de Event Logs
- [ ] **Módulo de Rede**: Testes de conectividade e diagnósticos
- [ ] **Módulo de Backup**: Scripts de backup automatizados
- [ ] **Galeria de Snippets**: Trechos de código reutilizáveis
- [ ] **Laboratório Virtual**: VMs e ambientes de teste

## 🛠️ Exemplos Destacados

### 1. Gerenciamento de Serviços
```powershell
# Reiniciar serviço remoto
Invoke-Command -ComputerName "SERVER01" -ScriptBlock {
    Restart-Service -Name "MeuServico" -Force
}
```

### 2. Criação de Perfil Personalizado
```powershell
# Carregar funções do perfil
New-PowerShellProfile -ProfileType Advanced
```

### 3. Análise de Políticas de Segurança
```powershell
# Verificar configurações de segurança
.\politicas-powershell.ps1
```

## 🔧 Requisitos

- **Windows** 10/11 ou Windows Server 2016+
- **PowerShell** 5.1+ (PowerShell 7.x recomendado)
- **Privilégios** de administrador (para alguns scripts)
- **Execution Policy** configurada:
  ```powershell
  Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
  ```

## 🎓 Roteiro de Estudos Sugerido

### Semana 1-2: Fundamentos
- Conceitos básicos e cmdlets essenciais
- Pipeline e objetos PowerShell
- Comparação com Batch e CMD

### Semana 3-4: Intermediário  
- Funções e scripts personalizados
- Gerenciamento de serviços e processos
- Manipulação de arquivos e registro

### Semana 5-6: Avançado
- Políticas e segurança
- Perfis personalizados
- Remoting e automação

### Semana 7-8: Prática
- Projetos reais de administração
- Criação de módulos próprios
- Otimização e melhores práticas

## 🤝 Como Contribuir

1. **Fork** este repositório
2. **Clone** seu fork localmente
3. **Crie** uma branch para sua feature: `git checkout -b minha-feature`
4. **Implemente** seus exemplos e documentação
5. **Commit** suas mudanças: `git commit -m "Adiciona exemplo X"`
6. **Push** para a branch: `git push origin minha-feature`
7. **Abra** um Pull Request

### Tipos de Contribuições Bem-vindas

- ✨ **Novos exemplos** práticos
- 📚 **Documentação** e explicações
- 🐛 **Correções** de bugs nos scripts
- 🔍 **Melhorias** na organização
- 🌍 **Traduções** para outros idiomas
- 💡 **Ideias** e sugestões via Issues

## 📚 Recursos Externos

- [Documentação Oficial PowerShell](https://docs.microsoft.com/pt-br/powershell/)
- [PowerShell Gallery](https://www.powershellgallery.com/)
- [PowerShell Community](https://github.com/PowerShell/PowerShell)
- [TechNet Script Center](https://gallery.technet.microsoft.com/scriptcenter)

## 📞 Contato e Suporte

- **Issues**: Para relatar problemas ou sugerir melhorias
- **Discussions**: Para perguntas gerais e discussões
- **Wiki**: Documentação adicional e FAQs

## 📄 Licença

Este projeto está licenciado sob a **MIT License** - veja o arquivo [LICENSE](LICENSE) para detalhes.

## 🙏 Agradecimentos

- Comunidade PowerShell
- Microsoft PowerShell Team
- Todos os contribuidores deste repositório

---

<div align="center">

**🚀 Bons estudos e happy scripting! 🚀**

[![Star this repo](https://img.shields.io/badge/⭐-Star%20this%20repo-yellow?style=for-the-badge)](https://github.com/seu-usuario/powershell-estudos)
[![Follow](https://img.shields.io/badge/👤-Follow%20me-blue?style=for-the-badge)](https://github.com/seu-usuario)

</div>