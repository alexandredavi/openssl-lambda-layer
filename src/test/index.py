import os
import subprocess

def handler(event, context):
    subprocess.run(["openssl","genrsa", "2048"], env={'PATH': os.environ['PATH']})

