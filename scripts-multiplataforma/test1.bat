@ECHO OFF
echo Buscando serviço "Bytebank Interface Service" no servidor XPTO1
sc \\XPTO1 query "Bytebank Interface Service" | find /i "STATE" | find /i "RUNNING"

IF %ERRORLEVEL% NEQ 0 (
    echo Serviço não encontrado ou não está em execução.
) ELSE (
    echo Parando o serviço...
    sc \\XPTO1 stop "Bytebank Interface Service"
    echo Iniciando o serviço...
    sc \\XPTO1 start "Bytebank Interface Service"
    echo Serviço reiniciado com sucesso.
)