# RequestApp

Para iniciar seu servidor Phoenix:

  * Instalar dependências com `mix deps.get`
  * Iniciar phoenix com `mix phx.server`

Executar a aplicação via HTTPoison Base:

  * `mix run priv/mode1_playground.exs`

Executar a aplicação via HTTPoison ou Tesla:

  * Alterar variável de ambiente em `config/config.exs`
    * `config :request_app, :http_client, TeslaClient` ou `config :request_app, :http_client, HttpoisonClient`
  * `mix run priv/mode2_playground.exs`

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
