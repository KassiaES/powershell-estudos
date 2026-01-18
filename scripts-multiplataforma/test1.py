# test1.py - Versão Python simples do test1.bat
import subprocess
import time

# Configurações
SERVER = "XPTO1"
SERVICE = "Bytebank Interface Service"

print(f'Buscando serviço "{SERVICE}" no servidor {SERVER}')

# Consulta o serviço (equivalente ao sc query)
result = subprocess.run(['sc', f'\\\\{SERVER}', 'query', SERVICE], 
                       capture_output=True, text=True)

# Verifica se está rodando (equivalente ao find /i "RUNNING")
if "RUNNING" not in result.stdout.upper():
    print("Serviço não encontrado ou não está em execução.")
else:
    print("Parando o serviço...")
    subprocess.run(['sc', f'\\\\{SERVER}', 'stop', SERVICE])
    
    time.sleep(2)  # Aguarda um pouco
    
    print("Iniciando o serviço...")
    subprocess.run(['sc', f'\\\\{SERVER}', 'start', SERVICE])
    
    print("Serviço reiniciado com sucesso.")