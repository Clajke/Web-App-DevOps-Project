from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient

key_vault_url = "https://JordAksKeyVault.vault.azure.net/"

# Initialize credential
credential = DefaultAzureCredential()

# Initialize SecretClient
secret_client = SecretClient(vault_url=key_vault_url, credential=credential)

# Replace "DatabaseName" with the actual name of your secret
secret_name = "DatabaseName"
secret = secret_client.get_secret(secret_name)

print("Secret Value:", secret.value)

#Please change DatabaseName where appropriate for the other secrets required. 

