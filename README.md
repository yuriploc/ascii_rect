# AsciiRect

## Setting up the project

If you have Docker installed, run `docker-compose -p ascii-rect up -d` to start the services.

Then, to setup the Phoenix server: `mix deps.get && mix ecto.reset` should get your database seeded and ready to go.

And to start the server: `iex -S mix phx.server`.

## Experimenting with the API

With the database seeded, you can select a `canvas.external_uuid` and `CURL` it:

```sh
curl http://localhost:4000/api/canvases/<external_uuid>
```

// TODO

// To create a canvas, you'll POST to

```sh
curl -X POST http://localhost:4000/api/canvases
```
