from flask import Flask, render_template, request, redirect, url_for
from sqlalchemy import create_engine, Column, Integer, String, DateTime
from sqlalchemy.orm import sessionmaker
from sqlalchemy.ext.declarative import declarative_base
from azure.identity import ManagedIdentityCredential
from azure.keyvault.secrets import SecretClient
import pyodbc
import os

# Initialise Flask App
app = Flask(__name__)

# Replace this value with your Key Vault URL
key_vault_url = "https://jordakskeyvault.vault.azure.net/"

# Set up Azure Key Vault client with Managed Identity
credential = ManagedIdentityCredential()
secret_client = SecretClient(vault_url=key_vault_url, credential=credential)

# Access the secret values from Key Vault
secret = secret_client.get_secret("DatabaseName")

# Access the secret value
secret_value = secret.value

# database connection 
server = 'devops-project-server.database.windows.net'
database = 'orders-db'
username = 'maya'
password = secret_value  # Use the retrieved secret value
driver= '{ODBC Driver 18 for SQL Server}'

# Create the connection string
connection_string=f'Driver={driver};\
    Server=tcp:{server},1433;\
    Database={database};\
    Uid={username};\
    Pwd={password};\
    Encrypt=yes;\
    TrustServerCertificate=no;\
    Connection Timeout=30;'

# Create the engine to connect to the database
engine = create_engine("mssql+pyodbc:///?odbc_connect={}".format(connection_string))
engine.connect()

# Create the Session
Session = sessionmaker(bind=engine)

# Define the Order data model
Base = declarative_base()

class Order(Base):
    __tablename__ = 'orders'
    date_uuid = Column('date_uuid', String, primary_key=True)
    user_id = Column('User ID', String, primary_key=True)
    card_number = Column('Card Number', String)
    store_code = Column('Store Code', String)
    product_code = Column('product_code', String)
    product_quantity = Column('Product Quantity', Integer)
    order_date = Column('Order Date', DateTime)
    shipping_date = Column('Shipping Date', DateTime)

# Define routes...

# Run the app
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
