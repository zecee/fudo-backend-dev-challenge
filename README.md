# Fudo Backend Dev Challenge
![Tests](https://github.com/zecee/fudo-backend-dev-challenge/actions/workflows/test.yml/badge.svg)
![Ruby version](https://img.shields.io/badge/ruby-3.4.2-blue)
![API Version](https://img.shields.io/badge/api%20version-v1-green)

Implementación de API en Ruby utilizando Sinatra y Rack, siguiendo los requerimientos del desafío técnico propuesto por Fudo.

## Versiones utlizadas

- Ruby 3.4.2
- Bundler (`gem install bundler`)
- Docker (opcional)


## Cómo correr el proyecto

Clonar el repositorio:

```bash
  git clone https://github.com/zecee/fudo-backend-dev-challenge.git
  cd fudo-backend-dev-challenge
```

### Opción 1: Local (Ruby)

Instalar las dependencias

```
bundle install
```
Ejecutar la aplicación

```bash
ruby app.rb
```

La API quedará disponible en http://localhost:4567.


### Opción 2: Docker

```bash
docker build -t fudo-api .
docker run -p 4567:4567 fudo-api
```

## Ejecutar los tests

Para ejecutar todos los tests:
```bash
rake run_tests
```

## Estructura del proyecto

```bash
├── models/
│   ├── product.rb
│   └── user.rb
├── routes/
│   ├── api/v1/
│   │   ├── product_routes.rb
│   │   └── user_routes.rb
│   └── static_routes.rb
├── test/
│   ├── test_helper.rb
│   └── routes/
│       ├── api/v1/
│       │   ├── product_routes_test.rb
│       │   └── user_routes_test.rb
│       └── static_routes_test.rb
├── .ruby-version
├── app.rb
├── AUTHORS
├── Dockerfile
├── fudo.md
├── Gemfile
├── Gemfile.lock
├── helpers.rb
├── http.md
├── openapi.yaml
├── Rakefile
├── README.md
├── tcp.md
```
