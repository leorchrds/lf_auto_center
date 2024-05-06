# LF Auto Center

LF Auto Center é um sistema de gerenciamento para oficinas mecânicas, projetado para simplificar e automatizar diversas tarefas relacionadas ao dia a dia do estabelecimento.

Este projeto está em constante desenvolvimento, com novos recursos sendo adicionados regularmente para melhorar a experiência do usuário e expandir as capacidades do sistema.

## Funcionalidades Atuais

- Cadastro e controle de clientes e veículos
- Geração de ordens de serviço
- Controle de serviços
- controle de orçamentos

## Uso Particular

O LF Auto Center foi desenvolvido para atender às necessidades específicas da nossa oficina mecânica. Embora estejamos compartilhando o código fonte publicamente, é importante observar que algumas características ou personalizações podem refletir as particularidades do nosso ambiente de trabalho. No entanto, encorajamos outros proprietários de oficinas a explorar e adaptar o sistema às suas próprias necessidades.

## Contribuindo

Nós valorizamos muito a contribuição da comunidade para o projeto LF Auto Center. Se você tiver ideias para melhorias, encontrar bugs ou quiser colaborar de qualquer forma, fique à vontade para abrir uma issue ou enviar um pull request.

## Tecnologias utilizadas
- [Ruby](https://www.ruby-lang.org/pt/) (2.5.0)
- [Rails](https://rubyonrails.org/) (5.2.8.1)
- [SQLite3](http://www.sqlite.org) (3.37.2)

## Ferramentas utilizadas
- [Devise](https://github.com/heartcombo/devise) para autenticação
- [Rails-I18n](https://github.com/svenfuchs/rails-i18n) para internacionalização
- [Kaminari](https://github.com/kaminari/kaminari) para paginação
- 
## Instruções para uso
Clone o projeto em sua máquina e instale as dependências do projeto com os comandos:
```bash
bundle
yarn
```

Logo após, crie o banco de dados com:
```bash
rails db:create
rails db:migrate
```

Para inicializar o banco de dados com dados, rode:
```bash
rails dev:setup
```

Levante e rode a aplicação com:
```bash
rails s
```
E, finalmente, acesse ```http://localhost:3000``` no seu navegador.

