import os
import sys
import subprocess
import time

# Mantem o programa aberto
session = True

def verificar_root():
  """Garante que o script está sendo executado como root."""
  if os.geteuid() != 0:
    print(
        "Erro 102 - Você não tem permissão de root (Use sudo python3 main.py)"
    )
    sys.exit(1)
verificar_root()

#Limpa a tela do terminal
def limpar_tela():
  os.system("clear" if os.name == "posix" else "cls")

#pausa
def pausar():
  input("\nPressione [Enter] para continuar...")

# Lets see Partit
def ver_particoes():
  limpar_tela()
  print("=== Partições Disponíveis (lsblk) ===")
  subprocess.run(["lsblk", "-f"])
  pausar()
  
def cfdisk():
  try:
    subprocess.run(["sudo", "cfdisk"], check=True)
  except subprocess.CalledProcessError:
    print("Erro 103 - Você não tem permissão de root para o cfdisk", file=sys.stderr)
  except FileNotFoundError:
    print("Erro 707 - Por algum motivo o cfdisk não foi encontrado", file=sys.stderr)
    
def btop():
  try:
    subprocess.run(["sudo", "btop"], check=True)
  except subprocess.CalledProcessError:
    print("Erro 103 - Você não tem permissão de root para o btop", file=sys.stderr)
  except FileNotFoundError:
    print("Erro 707 - Por algum motivo o btop não foi encontrado", file=sys.stderr)
    
def htop():
  try:
    subprocess.run(["sudo", "htop"], check=True)
  except subprocess.CalledProcessError:
    print("Erro 103 - Você não tem permissão de root para o htop", file=sys.stderr)
  except FileNotFoundError:
    print("Erro 707 - Por algum motivo o htop não foi encontrado", file=sys.stderr)
    
def nmtui():
  try:
    subprocess.run(["sudo", "nmtui"], check=True)
  except subprocess.CalledProcessError:
    print("Erro 103 - Você não tem permissão de root para o nmtui", file=sys.stderr)
  except FileNotFoundError:
    print("Erro 707 - Por algum motivo o nmtui não foi encontrado", file=sys.stderr)

def verificar_integridade():
  """Funcionalidade extra: Verificação rápida de espaço em disco e pacotes."""
  limpar_tela()
  print("=== Informações e Diagnóstico do Sistema ===")
  print("\n1. Espaço em Disco (df -h):")
  subprocess.run(["df", "-h"])
  print("\n2. Memória RAM Livre:")
  subprocess.run(["free", "-h"])
  pausar()

# Cabecalho
print("Central de Manuntenção do OxyohanOS")
print("Build 1.0.35.jzww.gbdl.oxy.debian")
print("Criado por JohnzinOmochain")
print("---------------------------------------------------")
print("ESSE SOFTWARE É LICENSIADO PELA LICENSA MIT")

# Input e ações
while session == True:
  print("1 - Sair")
  print("2 - Mostrar data e hora")
  print("3 - Mostrar as particoes")
  print("4 - Gerenciar partições (cfdisk)")
  print("5 - Diagnóstico rápido (Espaço em disco / RAM)")
  print("6 - Monitorar o Sistema (6.1 - btop | 6.2 - htop) (Ctrl+C sai do btop e F10 do htop)")
  print("7 - Gerenciar redes (nmtui)")
  inpuu = input()
  if inpuu == "1":
    # Fecha o programa
    session = False
  elif inpuu == "2":
    print(subprocess.run("date"))
  elif inpuu == "3":
    ver_particoes()
  elif inpuu == "4":
    cfdisk()
  elif inpuu == "5":
    verificar_integridade()
  elif inpuu == "6.1":
    btop()
  elif inpuu == "6.2":
    htop()
  elif inpuu == "7":
    nmtui()
  else:
    print("Comando não encontrado")
