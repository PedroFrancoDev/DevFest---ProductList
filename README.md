# Dev Fest Product List

## Descrição
Aplicativo mobile para listagem de produtos, desenvolvido com foco em arquitetura limpa (Clean Architecture) e boas práticas de desenvolvimento.

## Arquitetura
O projeto segue a Clean Architecture, separando responsabilidades em camadas:
- **domain**: modelos e regras de negócio
- **data**: repositórios e acesso a dados
- **ui**: interface do usuário e view models
- **config/di**: configuração e injeção de dependências

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

## Licença
[MIT](LICENSE)
