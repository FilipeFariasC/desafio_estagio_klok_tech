# Desafio Completo de Projeto de Estágio - Klok Tech

Esse é o repositório onde ficará armazenado o a configuração do docker como também os links para os repositórios.


Requisitos no desafio [neste link](estagio-dev-klok-tech.pdf).

Workspace no Postman [API 1](https://www.postman.com/filipefariasc/workspace/desafio-klok-tech-estagio-api-1).

Workspace no Postman [API 2](https://www.postman.com/filipefariasc/workspace/desafio-klok-tech-estagio-api-2).


<table>
  <thead style="font-weight: bold">
    <tr >
      <td colspan="6" align="center">
        <b>Ambiente de Desenvolvimento</b>
      </td>
    </tr>
    <tr>
      <td><b>SO</b></td>
      <td><b>IDE</b></td>
      <td><b>Versão</b></td>
      <td><b>Codificação</b></td>
      <td><b>Java</b></td>
      <td><b>Vendor</b></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Ubuntu 20.04.4 LTS Focal Fossa</td>
      <td>Spring Tools Suite</td>
      <td>4.14.0.RELEASE</td>
      <td>UTF-8</td>
      <td>17.0.2</td>
      <td>Oracle</td>
    </tr>
  </tbody>
</table>

## Obtendo o código-fonte:

Esse projeto utiliza submódulos logo para a obtenção do projeto é necessário fazer:

```bash
git clone --recurse-submodules https://github.com/FilipeFariasC/desafio_estagio_klok_tech.git
```

## Empacotando o projeto

Dentro de cada pasta do projeto execute:

```bash
# No diretório desafio_estagio_klok_api_1
./mvnw clean package spring-boot:repackage
# No diretório desafio_estagio_klok_api_2
./mvnw clean package spring-boot:repackage
```

### Instalação com Java

Para a utilização desse código apenas com o java é necessário ter instalado:

> Oracle Java 17.0.2
> 
> Postgres 14.2-1
> 
> RabbitMQ 3.9.14

#### Para a configuração do PostgreSQL:
No **psql**:

```pgsql
CREATE USER klok_dev_est WITH PASSWORD 'klokdevest';

CREATE DATABASE klok_dev_est_api_1;
CREATE DATABASE klok_dev_est_api_2;

GRANT ALL PRIVILEGES ON DATABASE klok_dev_est_api_1 TO klok_dev_est;
GRANT ALL PRIVILEGES ON DATABASE klok_dev_est_api_2 TO klok_dev_est;
```

#### Para a configuração do RabbitMQ:
No **shell**:

```bash
sudo rabbitmqctl add_user klok_dev_est klokdevest
sudo rabbitmqctl set_user_tags klok_dev_est administrator
sudo rabbitmqctl set_permissions -p / klok_dev_est ".*" ".*" ".*"
```

#### Alteração do application.properties:
No arquivo **application.properties** de cada projeto.
> desafio_estagio_klok_api_1/src/main/resources/application.properties
> desafio_estagio_klok_api_2/src/main/resources/application.properties

Altere o valor da propriedade **spring.rabbitmq.addresses** para  **rabbitmq:5672**.
> spring.rabbitmq.addresses=localhost:5672

Altere o valor da propriedade **spring.datasource.url** para **jdbc:postgresql://db-estagio:5432/klok_dev_est_api_1** no arquivo **desafio_estagio_klok_api_1/src/main/resources/application.properties**.
> spring.datasource.url=jdbc:postgresql://localhost:5432/klok_dev_est_api_1

Altere o valor da propriedade **spring.datasource.url** para **jdbc:postgresql://db-estagio:5432/klok_dev_est_api_2** no arquivo **desafio_estagio_klok_api_2/src/main/resources/application.properties**.
> spring.datasource.url=jdbc:postgresql://localhost:5432/klok_dev_est_api_2

#### [Empacote o projeto](#empacotando-o-projeto):

#### Execução em Jar

```bash
java -Duser.timezone=GMT-03:00 -Xmx512m -Xmx256m -jar desafio_estagio_klok_api_1/target/challenge-0.1-SNAPSHOT.jar
java -Duser.timezone=GMT-03:00 -Xmx512m -Xmx256m -jar desafio_estagio_klok_api_2/target/challenge-0.1-SNAPSHOT.jar

```

## Instalação com Docker + Docker Compose
Caso você possua o Docker Engine + Docker Compose:

> Docker Engine Community 20.10.14 (API version 1.41)
> 
> Docker Compose 1.29.2

#### Alteração do application.properties

No arquivo **application.properties** de cada projeto.
> desafio_estagio_klok_api_1/src/main/resources/application.properties
> desafio_estagio_klok_api_2/src/main/resources/application.properties

Altere o valor da propriedade **spring.rabbitmq.addresses** para  **rabbitmq:5672**.
> spring.rabbitmq.addresses=rabbitmq:5672

Altere o valor da propriedade **spring.datasource.url** para **jdbc:postgresql://db-estagio:5432/klok_dev_est_api_1** no arquivo **desafio_estagio_klok_api_1/src/main/resources/application.properties**.
> spring.datasource.url=jdbc:postgresql://db-estagio:5432/klok_dev_est_api_1

Altere o valor da propriedade **spring.datasource.url** para **jdbc:postgresql://db-estagio:5432/klok_dev_est_api_2** no arquivo **desafio_estagio_klok_api_2/src/main/resources/application.properties**.
> spring.datasource.url=jdbc:postgresql://db-estagio:5432/klok_dev_est_api_2

#### [Empacote o projeto](#empacotando-o-projeto)
#### Execução em Docker

**Na raiz desse repositório**.

Para iniciar a aplicação:

```bash
sudo docker-compose up
```

Para finalizar a aplicação:

> Aperte **Ctrl + C**

OU
```bash
sudo docker-compose stop 
``` 

Para remover os containers:
```bash
sudo docker-compose down
```
