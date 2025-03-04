Conectarse a las instancias virtuales
Primero debes ejecutar el terraform outputcomando para obtener la clave SSH:
terraform output -raw tls_private_key > id_rsa

Ejecute el comando terraform a continuación para verificar más detalles:
terraform output public_ip_address

Utilice SSH para conectarse a la instancia:
ssh -i id_rsa azureuser@<public_ip_address>
