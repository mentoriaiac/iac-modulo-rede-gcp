Modulo do terraform para criar recursos de rede e politica de firewall no GCP 
----

Veja [aqui](AUTENTICACAO_GCLOUD.md) os procedimentos para criar uma conta de serviço no Google Cloud.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | 3.73.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 3.73.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_compute_firewall.firewall](https://registry.terraform.io/providers/hashicorp/google/3.73.0/docs/resources/compute_firewall) | resource |
| [google_compute_network.vpc_network](https://registry.terraform.io/providers/hashicorp/google/3.73.0/docs/resources/compute_network) | resource |
| [google_compute_subnetwork.subnetworks](https://registry.terraform.io/providers/hashicorp/google/3.73.0/docs/resources/compute_subnetwork) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_firewall_allow"></a> [firewall\_allow](#input\_firewall\_allow) | Lista de portas para permitir no firewall | <pre>list(object({<br>    protocol = string<br>    port     = list(number)<br>  }))</pre> | n/a | yes |
| <a name="input_mtu"></a> [mtu](#input\_mtu) | Unidades maxmimas de unidades de transimiss├úo em bytes. O valor minimo valido ├® 1460 e o maximo ├® 1500 bytes. | `number` | `1460` | no |
| <a name="input_project"></a> [project](#input\_project) | nome do projeto existente no google cloud | `string` | n/a | yes |
| <a name="input_subnetworks"></a> [subnetworks](#input\_subnetworks) | Lista do objeto de network | <pre>list(object({<br>    name          = string<br>    ip_cidr_range = string<br>    region        = string<br>  }))</pre> | n/a | yes |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | nome da vpc | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_subnets_id"></a> [subnets\_id](#output\_subnets\_id) | Retorna uma lista de objetos com os atributos das subnets criadas |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | Retorna o id da VPC criada |
