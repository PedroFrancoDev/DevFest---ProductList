# Dev Fest Product List

## Descrição
Aplicativo mobile para listagem de produtos, desenvolvido com foco em Clean Architecture e MVVM, seguindo as boas práticas recomendadas pela documentação oficial do Flutter.

## Arquitetura
O projeto utiliza uma combinação de Clean Architecture e MVVM (Model-View-ViewModel), conforme sugerido na documentação do Flutter para projetos escaláveis e testáveis:
- **domain**: modelos e regras de negócio
- **data**: repositórios e acesso a dados
- **ui**: interface do usuário e view models (MVVM)
- **config/di**: configuração e injeção de dependências

## Tech Stack
- Flutter
- Dart
- Clean Architecture
- MVVM
- GetIt (Dependency Injection)
- GitHub Actions (CI/CD)
- Firebase App Distribution

Essa abordagem separa claramente as responsabilidades, facilitando manutenção, testes e evolução do app.

## Principais Pastas
- `lib/domain`: modelos, entidades e contratos
- `lib/data`: implementações de repositórios e fontes de dados
- `lib/ui`: telas, widgets e view models
- `lib/config`: configurações gerais e injeção de dependências

## Como rodar
1. Instale as dependências:
   ```bash
   flutter pub get
   ```
2. Execute o app:
   ```bash
   flutter run
   ```

## Contribuição
Pull requests são bem-vindos. Para grandes mudanças, abra uma issue primeiro para discutir o que você gostaria de modificar.

## Screenshots
<p align="center">
  <img width="300" alt="Simulator Screenshot - iPhone 15 Pro - 2025-12-01 at 01 53 33" src="https://github.com/user-attachments/assets/7d5d442c-d858-479a-958c-e99fd611625e" />
  <img width="300" alt="Simulator Screenshot - iPhone 15 Pro - 2025-12-01 at 01 53 28" src="https://github.com/user-attachments/assets/c8eb5e2d-7a7c-494c-a03a-3eff88d0a95c" />
  <img width="300" alt="Simulator Screenshot - iPhone 15 Pro - 2025-12-01 at 01 53 17" src="https://github.com/user-attachments/assets/5cb14b5e-351d-4ac5-a9af-6941d2b88c6c" />
</p>

## Licença
[MIT](LICENSE)


