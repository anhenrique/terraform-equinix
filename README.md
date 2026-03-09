# Terraform Equinix vApp Deployment

Este projeto contém configurações Terraform para implantar vApps (Virtual Applications) no VMware Cloud Director (vCD) da Equinix. Ele permite criar e gerenciar máquinas virtuais (VMs) em um ambiente virtualizado.

## Descrição

O projeto utiliza um módulo Terraform localizado em `infra-vapp/` para provisionar vApps contendo múltiplas VMs baseadas em templates do catálogo vCD. As VMs são configuradas com recursos personalizáveis como CPU, memória e rede.

## Pré-requisitos

- [Terraform](https://www.terraform.io/downloads.html) >= 1.7.5
- Acesso ao VMware Cloud Director (vCD) da Equinix
- Token de API do vCD
- Conta com permissões para criar vApps e VMs no VDC especificado

## Estrutura do Projeto

```
terraform-equinix/
├── main.tf                 # Configuração principal do módulo
├── variables.tf            # Definição de variáveis
├── terraform.tfvars        # Valores padrão das variáveis
├── output.tf               # Outputs do Terraform
├── provider.tf             # Configuração do provider vCD
├── backend.tf              # Configuração do backend (GitLab)
├── environments/           # Arquivos de variáveis por ambiente
│   └── dev.tfvars          # Variáveis para ambiente de desenvolvimento
├── infra-vapp/             # Módulo para criação do vApp
│   ├── vapp.tf             # Recursos do vApp
│   ├── variables.tf        # Variáveis do módulo
│   ├── output.tf           # Outputs do módulo
│   ├── providers.tf        # Providers do módulo
│   ├── cloudinit.yaml      # Template Cloud-Init
│   └── scripts/            # Scripts de configuração
└── .gitlab-ci.yml          # Pipeline CI/CD GitLab
```

## Configuração

### Variáveis Principais

| Variável | Descrição | Tipo | Obrigatório |
|----------|-----------|------|-------------|
| `vcd_url` | URL base do vCD | string | Sim |
| `vcd_org` | Organização no vCD | string | Sim |
| `vcd_vdc` | VDC dentro da organização | string | Sim |
| `vcd_api_token` | Token de API para autenticação | string | Sim |
| `vapp_name` | Nome do vApp | string | Sim |
| `vapp_network` | Rede da organização | string | Sim |
| `vapp_catalog` | Catálogo que contém a template | string | Sim |
| `template_name` | Nome da template | string | Sim |
| `vm_numbers` | Quantidade de VMs | number | Sim |
| `vm_name_prefix` | Prefixo para nome das VMs | string | Sim |
| `default_password` | Senha padrão para VMs | string | Sim |

### Arquivo terraform.tfvars

Edite o arquivo `terraform.tfvars` com seus valores específicos:

```hcl
vcd_url          = "https://portal/api"
vcd_org          = "sua-organizacao"
vcd_vdc          = "seu-vdc"
vcd_api_token    = "seu-token-api"
vapp_name        = "meu-vapp"
vapp_network     = "rede-organizacao"
vapp_catalog     = "meu-catalogo"
template_name    = "ubuntu-20.04"
vm_numbers       = 2
vm_name_prefix   = "vm-"
default_password = "sua-senha-padrao"
```

## Uso

### Inicialização

```bash
terraform init
```

### Planejamento

```bash
terraform plan
```

### Aplicação

```bash
terraform apply
```

### Destruição

```bash
terraform destroy
```

## Ambientes

O projeto suporta múltiplos ambientes através de arquivos `.tfvars` na pasta `environments/`.

- `dev.tfvars`: Ambiente de desenvolvimento

Para usar um ambiente específico:

```bash
terraform plan -var-file=environments/dev.tfvars
terraform apply -var-file=environments/dev.tfvars
```

## CI/CD

O projeto inclui um pipeline GitLab CI/CD (`.gitlab-ci.yml`) que automatiza:

- Inicialização do Terraform
- Validação da configuração
- Planejamento das mudanças
- Aplicação das mudanças (em branches protegidos)

O estado do Terraform é gerenciado pelo GitLab e separado por ambiente.

### Variáveis de CI/CD Necessárias

Configure as seguintes variáveis no GitLab:

- `VCD_API_TOKEN`: Token de API do vCD
- `VCD_URL`: URL do vCD
- `VCD_ORG`: Organização vCD
- `VCD_VDC`: VDC

## Outputs

Após a aplicação, o Terraform fornecerá os seguintes outputs:

- `vm_ips`: IPs das VMs criadas
- `vapp_id`: ID do vApp
- Outros outputs definidos em `output.tf` e `infra-vapp/output.tf`

## Troubleshooting

### Problemas Comuns

1. **Erro de autenticação**: Verifique se o token de API é válido e tem as permissões necessárias.

2. **Rede não encontrada**: Confirme que a rede especificada existe no VDC.

3. **Template não encontrada**: Verifique se o catálogo e template existem e estão acessíveis.

4. **Limites de recursos**: Certifique-se de que há recursos suficientes (CPU, memória) no VDC.

### Logs de Debug

Para mais detalhes em caso de erro:

```bash
export TF_LOG=DEBUG
terraform apply
```

## Contribuição

1. Faça fork do projeto
2. Crie uma branch para sua feature (`git checkout -b feature/nova-feature`)
3. Commit suas mudanças (`git commit -am 'Adiciona nova feature'`)
4. Push para a branch (`git push origin feature/nova-feature`)
5. Abra um Merge Request

## Licença

Este projeto está sob a licença [MIT](LICENSE.txt).
