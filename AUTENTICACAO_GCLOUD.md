---
## Como criar uma conta de serviço no Google Cloud:
### Requisitos:

- Conta Google Cloud

- Gcloud instalado - veja como instalar [aqui](https://cloud.google.com/sdk/docs/install#deb)

- Conta com o FREE TIER habilitado ou uma forma de pagamento ativa.

**Autenticação no glcoud:**

```$ gcloud auth login``` Realize o processo de autenticação na aba do navegador que irá abrir.

**Criando um projeto novo:** *Ignore caso já exista um projeto*

```$ gcloud projects create nomedoprojeto --billing-project=seubillingaccount```

e defina o seu projeto como padrão:

`$ gcloud config set project PROJECT_ID`

**Habilite a conta de pagamento para o projeto:** *Caso o seu projeto já exista, provavelmente a conta de pagamento já está habilitada.

**importante:* Execute o comando abaixo para obter o BILLING ACCOUNT ID*

`$ gcloud alpha billing accounts list`

defina o uma conta de pagamentos ao projeto criado, use o id da saida do comando acima.

`$ gcloud alpha billing projects link PROJECT_ID --billing-account 0X0X0X-0X0X0X-0X0X0X`

**Criando conta de serviço**

Troque os valores de exemplo para os valores que você deseja!

Rode o comando para criar a conta de serviço:

`$ gcloud iam service-accounts create nomedacontadeservico`

dar a permissão para a conta de serviço gerenciar os recursos do projeto:

```
$ gcloud projects add-iam-policy-binding PROJECT_ID \
--member="serviceAccount:nomedacontadeservico@PROJECT_ID.iam.gserviceaccount.com"  --role="roles/editor"
```
 
e esse comando para criar a key de autenticação:
``` 
$ gcloud iam service-accounts keys create key.json \
--iam-account=nomedacontadeservico@PROJECT_ID.iam.gserviceaccount.com
```
Definar o key.json na varivel de ambiente com o comando:

```
$ export GOOGLE_APPLICATION_CREDENTIALS=${PWD}/key.json
```
lembre-se de colocar o caminho correto de onde está sua key.json.

**Habilitar API's necessarias:**

```
$ gcloud services enable compute.googleapis.com
```

caso você precise de habilitar mais API's rode o comando:

`$ gcloud.cmd services list`

e copie o nome do serviço que você necessita execute o passo anterior.

*os comando foram validados em um ambiente com ubuntu 20.04*

**GitHub Actions**

Para realizar o CI/CD é necessário que tenha em mãos o PROJECT_ID e a GCP_KEY e salvá-los em Secrets com seus devidos nomes:
- GCP_KEY
- GCP_PROJECT_ID

![image](https://user-images.githubusercontent.com/84750652/128938359-c7bbae3a-cb5b-4ab1-a0b0-a70d7af20802.png)

O arquivo de variáveis consumido para teste está dentro de 'how-to-use-this-module'

Os gatilhos para iniciar o teste são o 'pull-request' e o 'push' na 'branch: main'
