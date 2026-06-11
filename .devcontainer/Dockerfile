# ============================================================================
#  Dockerfile — "receta" para construir la imagen del curso
# ============================================================================
#  Un Dockerfile es un archivo de texto con instrucciones paso a paso que
#  Docker (o Codespaces) lee de arriba hacia abajo para fabricar una
#  "imagen". Una imagen es como un molde congelado de un sistema Linux
#  listo para usar; cada vez que abres el Codespace, se crea un
#  "contenedor" a partir de ese molde.
#
#  Analogía: la imagen es el PLANO, el contenedor es la CASA construida
#  con ese plano. Puedes construir muchas casas iguales a partir de un
#  solo plano, y si destruyes una casa el plano sigue intacto.
#
#  Cada instrucción (FROM, ENV, RUN...) crea una "capa". Docker guarda
#  esas capas en caché: si no cambias las primeras líneas, no las
#  reconstruye y el siguiente build es casi instantáneo.
# ============================================================================


# ----------------------------------------------------------------------------
# FROM: imagen base sobre la que vamos a construir
# ----------------------------------------------------------------------------
# En lugar de partir de cero, partimos de la imagen oficial de Kali Linux
# en su versión "rolling" (actualización continua, siempre al día).
# Todo lo que instalemos más abajo se apila ENCIMA de esta base.
FROM kalilinux/kali-rolling:latest

#-----------------------------------------------------------
#Detailed explanation from Ashley Espinoza
#-----------------------------------------------------------
# Part A
#Docker reads each instruction from top to bottom and creates an image with the operating system, tools, variables, and shell settings needed for the labs.

# A Docker image is the saved template. A container is the running instance created from that template. This matches the lab idea from Black Hat Bash Chapter 3, where Kali Linux and containers are used to build a safe practice environment.
# Docker builds images in layers. Each instruction creates a new layer, and Docker can reuse cached layers if earlier instructions do not change. For that reason, instruction order matters: stable setup steps should appear before
# commands that change often.
# -----------------------------------------------------------
# FROM: base image
# -----------------------------------------------------------
# This instruction selects Kali Linux Rolling as the base image.
# A base image provides the starting Linux filesystem and package manager.
# Kali is a good choice for this course because Black Hat Bash Chapter 3 uses Kali as the main lab operating system for security practice. It also comes from a Debian-based environment, so it works well with apt, shell tools, and many cybersecurity utilities.
# The "latest" tag tells Docker to pull the current Kali Rolling image available when the container is rebuilt.
FROM kalilinux/kali-rolling:latest



# ----------------------------------------------------------------------------

# Part B image layers and cache

# Docker does not build the whole image as one single piece. It builds it step by step. Each instruction creates a layer, and Docker stores that layer in its cache.

# If I rebuild the container and the first instructions are the same, Docker can reuse those cached layers instead of running them again, this makes the build faster.
# The order of the instructions matters. I should place stable steps first, such as the base image and environment variables. Steps that change more often should go later. If I change an early line, Docker has to rebuild that layer and all the layers after it.

# This is useful in a lab container because installing packages can take time.
# Keeping the Dockerfile organized helps Codespaces rebuild the environment faster and with fewer repeated downloads. BHB Ch.3.

#----------------------------------------------------------------------------------

# ENV: torno permanentes dentro del contenedor
# ----------------------------------------------------------------------------
# Las variables de entorno son "ajustes globales" que cualquier programa
# del sistema puede leer. Se escriben en MAYÚSCULAS por convención.
#
#   DEBIAN_FRONTEND=noninteractive
#     Le dice al instalador de paquetes (apt) "no me hagas preguntas
#     interactivas, asume respuestas por defecto". Sin esto, algunos
#     paquetes pausarían el build esperando que pulsemos una tecla y se
#     quedaría colgado para siempre (porque no hay nadie mirando).
#
#   LANG / LC_ALL=es_ES.UTF-8
#     Configuran idioma y codificación de caracteres. UTF-8 es lo que
#     permite que acentos, ñ, €, emojis, etc. se muestren bien.
#
#   TERM=xterm-256color
#     Le indica a los programas que la terminal admite 256 colores, para
#     que vim, nvim, htop, etc. se vean con todos sus colores.
#
# La barra invertida "\" al final de cada línea significa "esto continúa
# en la línea siguiente". Solo es para legibilidad.
ENV DEBIAN_FRONTEND=noninteractive \
    LANG=es_ES.UTF-8 \
    LC_ALL=es_ES.UTF-8 \
    TERM=xterm-256color



#---------------------------------------------------------------------------
# Part C ENV (DEBIAN_FRONTEND, LANG, LC_ALL, TERM)
#This ENV instruction defines default environment variables for the container, I use these variables because many Linux commands and programs read the shell environment before they run, as explained in Black Hat Bash Ch.1.
#DEBIAN_FRONTEND=noninteractive makes package installation automatic. It prevents apt from stopping the Docker build to ask questions, which is important because the container must build without user input.

LANG=es_ES.UTF-8 
#sets the main language and text encoding. LC_ALL=es_ES.UTF-8 forces the same locale rules for all programs. Together, they help the terminal show Spanish text, accents, and special characters correctly.

TERM=xterm-256color 
#tells terminal applications that the terminal supports color. This helps tools such as vim, htop, and other command-line programs display their interface correctly.
#The backslash at the end of each line keeps the command readable while still making it one single ENV instruction.

ENV DEBIAN_FRONTEND=noninteractive \
    LANG=es_ES.UTF-8 \
    LC_ALL=es_ES.UTF-8 \
    TERM=xterm-256color




# ----------------------------------------------------------------------------I
# Pre-respuesta a una pregunta interactiva de Wireshark
# ----------------------------------------------------------------------------
# Wireshark/tshark PREGUNTA durante su instalación si los usuarios
# normales (no-root) deben poder capturar paquetes. Como en el contenedor
# siempre somos root, respondemos "false" POR ADELANTADO usando
# debconf-set-selections para que no detenga el build esperando input.
RUN echo "wireshark-common wireshark-common/install-setuid boolean false" \
    | debconf-set-selections
#-----------------------------------------------------------------------------
#Part D RUN ... debconf-set-selections}
#This RUN command prepares an automatic answer for the Wireshark package setup.
#Some Debian packages ask configuration questions while they are being installed.
#In a Docker build, this is a problem because there is no user waiting to answer the prompt, so the build could stop.

#The echo command writes the answer that I want to send to the package system.
#The pipe sends that text into debconf-set-selections, which stores the answer before apt installs Wireshark or tshark.
#The value false means normal users will not be allowed to capture packets using the setuid option. This is safer for the container because packet capture should stay under root control.
#This connects with Black Hat Bash Ch.1 because it uses standard output and a pipe to send the result of one command as input to another command.
RUN echo "wireshark-common wireshark-common/install-setuid boolean false" \
    | debconf-set-selections

# ----------------------------------------------------------------------------


#-----------------------------------------------------------------------------    
# RUN: ejecutar comandos durante la construcción de la imagen
# ----------------------------------------------------------------------------
# Aquí instalamos TODO el software del curso en un solo RUN.
#
#   apt-get update          -> actualiza la lista de paquetes disponibles
#   apt-get install         -> descarga e instala los paquetes listados
#     -y                    -> responde "sí" automáticamente
#     --no-install-recommends -> instala SOLO lo esencial (no los extras
#                                sugeridos). Ahorra cientos de MB.
#
# ¿Por qué un solo RUN gigante y no 10 RUN pequeños?
# Porque CADA RUN crea una capa nueva en la imagen. Menos capas = imagen
# más pequeña, más rápida de construir y de descargar.
#
# El "&&" encadena comandos: ejecuta el siguiente SOLO SI el anterior
# terminó bien. Si algo falla, el build se detiene con error (que es lo
# que queremos: mejor un error claro que una imagen rota).
RUN apt-get update && apt-get install -y --no-install-recommends \
    \
    # === Editores de texto y shells (intérpretes de comandos) ===
    neovim \
    vim \
    zsh \
    bash-completion \
    \
    # === Herramientas de 4ta generación ===
    # Estas son las protagonistas de las Unidades 2, 3 y 4:
    perl \
    make \
    gawk \
    sed \
    grep \
    \
    # === Utilidades básicas de UNIX ===
    # coreutils trae cat, ls, head, tail, sort, cut, tr, etc.
    # findutils trae find y xargs.
    # procps trae ps, top, kill (gestión de procesos).
    # less = paginador para leer archivos largos.
    # tree = muestra directorios como árbol.
    # jq = procesa JSON desde la línea de comandos.
    coreutils \
    findutils \
    procps \
    less \
    tree \
    jq \
    \
    # === Páginas de manual (comando `man`) ===
    # La imagen base de Kali viene sin documentación para
    # ahorrar espacio. La reinstalamos porque en el curso "man bash" o
    # "man grep" es material de consulta obligada.
    man-db \
    manpages \
    manpages-posix \
    \
    # === Red básica y utilidades de descarga ===
    curl \
    wget \
    git \
    git-lfs \
    ca-certificates \
    locales \
    \
    # === Linter (revisor automático de errores) para scripts Bash ===
    shellcheck \
    \
    # === Reconocimiento y escaneo de red ===
    # nmap = el escáner de puertos más famoso.
    # masscan = escaneo masivo de rangos grandes de IPs.
    nmap \
    masscan \
    \
    # === Captura y análisis de paquetes de red ===
    # tcpdump = capturador clásico por terminal.
    # tshark = versión de terminal de Wireshark.
    tcpdump \
    tshark \
    \
    # === Utilidades de red variadas ===
    netcat-traditional \
    socat \
    dnsutils \
    whois \
    traceroute \
    mtr-tiny \
    iproute2 \
    net-tools \
    iputils-ping \
    \
    # === Anonimato: Tor y similares ===
    # tor = cliente de la red Tor.
    # torsocks = "envoltorio" que hace pasar cualquier comando por Tor.
    # proxychains4 = encadena múltiples proxies.
    # obfs4proxy = ofusca el tráfico de Tor para evadir bloqueos.
    tor \
    torsocks \
    proxychains4 \
    obfs4proxy \
    \
    #------------------------------------------------------------------
    # === Cliente HTTP más legible que curl para aprender ===
    httpie \
    \




 # --- Después de instalar, activamos el idioma español ---
 # sed busca "# es_ES.UTF-8" en /etc/locale.gen y le quita el "#" para
 # activar esa línea. Luego locale-gen compila los archivos de idioma.
 && sed -i 's/# es_ES.UTF-8/es_ES.UTF-8/' /etc/locale.gen \
 && locale-gen \
 \
#-------------------------------------------------------------
#Part f apt-get clean && rm 
#This command enables the Spanish UTF-8 locale inside the container.
#The sed -i command edits /etc/locale.gen directly and removes the comment symbol from the es_ES.UTF-8 line, so the system knows this locale should be generated.

#After that, locale-gen creates the locale files that Linux programs need.
#This is important because LANG and LC_ALL were already set to es_ES.UTF-8 in the ENV block. Without generating the locale, some programs could show warnings or handle Spanish characters incorrectly.

#This connects with Black Hat Bash Ch.1 because shell programs depend on environment settings to decide how text, output, and characters are processed.
#-------------------------------------------------------------

    
 # --- Limpieza final: reducir el tamaño de la imagen ---
 # apt deja archivos de caché que ya no necesitamos después de instalar.
 # Borrarlos aquí (en el mismo RUN) hace la capa final más pequeña.
 # Si los borráramos en otro RUN, seguirían ocupando en la capa anterior.
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
#------------------------------------------------------------------
#Part G apt-get clean && rm -rf /var/lib/apt/lists/*

#This cleanup step removes package cache files after the installation finishes.
#apt-get clean deletes downloaded package files that are no longer needed.

#The rm -rf /var/lib/apt/lists/* command removes the local package index files created by apt-get update. These files are useful during installation, but they do not need to stay inside the final image.

#I keep this cleanup in the same RUN block because Docker saves each RUN as a
#layer. If the cache were removed in a later RUN, the previous layer would still Keep the downloaded files and the image would stay larger.

#The && operator makes the cleanup run only if the previous command succeeded. This keeps the build safer and easier to debug.
#------------------------------------------------------------------

#Part E RUN apt-get update && apt-get install
#This RUN block installs the main tools needed for the course inside the image.
#I first run apt-get update because apt needs a fresh package index before it can install software. After that, apt-get install downloads and installs the packages listed below.


#The -y option answers yes automatically during installation. This keeps the Docker build from stopping to ask for confirmation.

#The --no-install-recommends option keeps the image smaller because apt installs only the required packages, not extra suggested tools.

#I keep these installations in one large RUN instruction because every RUN creates a new Docker layer. Using one RUN helps reduce image size and avoids repeated package setup steps.

#The && operator means the next command runs only if the previous command worked.
#This is useful because the build should stop if apt-get update fails instead of
#continuing with broken package information. Black Hat Bash Ch.1 explains this
#kind of command chaining with shell control operators.

#The backslash at the end of each line continues the same command on the next
#line. This makes the package list easier to read without changing how Bash runs the command.

#The installed tools support the course labs. vim and neovim are text editors.
#zsh and bash-completion improve shell work. gawk, sed, and grep are used for
#text processing. shellcheck helps find Bash script problems. nmap, masscan,
#tcpdump, tshark, netcat, and socat support networking and security practice.
#jq processes JSON output. man-db and manpages provide local command help.
#These ideas connect with Black Hat Bash Ch.1 for shell commands, Ch.2 for grep,
#sed, awk and text processing, and Ch.3 for Kali lab tooling.

#Text editors and shells used to write scripts and work inside the terminal.
#vim and neovim are useful for editing files from the command line.
#zsh is the interactive shell used when the container starts.
#bash-completion helps complete commands, paths, and options faster.

#Main scripting and text-processing tools for the course.
#perl and make support automation tasks.
#gawk, sed, and grep are important for filtering, editing, and extracting text.
#This connects with Black Hat Bash Ch.2 because those tools are used to process
#command output.

#Basic Unix utilities used in many labs and scripts.
#coreutils provides commands such as cat, ls, head, tail, sort, cut, and tr.
#findutils provides find and xargs for searching files and building pipelines.
#procps provides process tools such as ps, top, and kill.
#less helps read long outputs or manual pages.
#tree shows folder structure in a clear way.
#jq reads and filters JSON data from the command line.

#Manual pages used as local documentation inside the container.
#man-db enables the man command.
#manpages and manpages-posix add documentation for Linux and POSIX commands.
#This is useful because Black Hat Bash Ch.1 recommends using man to understand
#command options.


#Network download, Git, certificates, and locale support.
#curl and wget download data from URLs.
#git and git-lfs manage course repositories and large files.
#ca-certificates helps HTTPS connections trust valid certificates.
#locales allows the container to generate and use language settings.


#ShellCheck reviews Bash scripts and reports common syntax or style problems.
#This helps test scripts before running them in the lab.

#Network discovery and scanning tools.
#nmap is used for host discovery, service detection, and port scanning.
#masscan is used for faster scanning across large IP ranges.
#This connects with Black Hat Bash Ch.3 because the lab uses Kali for security
#practice.

#Packet capture and packet analysis tools.
#tcpdump captures network traffic from the terminal.
#tshark is the command-line version of Wireshark and helps inspect packets
#without a graphical interface.

#General networking utilities.
#netcat-traditional and socat help test connections and move data between
#sockets.
#dnsutils provides DNS tools such as dig and nslookup.
#whois checks domain registration information.
#traceroute and mtr-tiny help inspect network paths.
#iproute2 and net-tools show or manage network configuration.
#iputils-ping provides the ping command used to test connectivity.

#Proxy and anonymity-related tools for controlled lab practice.
#tor provides access to the Tor network.
#torsocks can run commands through Tor.
#proxychains4 sends traffic through configured proxies.
#obfs4proxy helps disguise Tor traffic in restricted networks.

#HTTPie is an HTTP client with readable output. It is useful for learning and testing web requests from the terminal.


# ----------------------------------------------------------------------------
# SHELL: qué intérprete usar en los siguientes RUN
# ----------------------------------------------------------------------------
# Por defecto Docker usa /bin/sh (un shell más limitado y antiguo). Lo
# cambiamos a bash por si agregamos más instrucciones con sintaxis
# moderna (arrays, [[ ]], etc.).
SHELL ["/bin/zsh", "-c"]
#----------------------------------------------------------------------------
#Part H SHELL ["/bin/bash","-c"]
#This instruction changes the shell that Docker will use for the next RUN commands.
#Docker normally uses /bin/sh by default, but this image switches to zsh here.

#Using zsh makes sense because the container is later configured to start with zsh and to load a custom .zshrc file. This keeps the build steps closer to the same shell environment that I will use when I open the container.

#The "-c" option tells zsh to read the command as a string and execute it.
#This is the same style used by shells when Docker runs commands during the image build.

#Black Hat Bash Ch.1 explains that the shell is the program that reads commands and runs them. In this Dockerfile, this line chooses which shell will interpret future RUN instructions.

# ----------------------------------------------------------------------------


#-------------------------------------------------------------------------------
# WORKDIR: directorio de trabajo al entrar al contenedor
# ----------------------------------------------------------------------------
# Codespaces siempre monta el código del repositorio en
# /workspaces/<nombre-del-repo>. Establecer /workspaces aquí hace que las
# terminales se abran cerca de nuestros archivos del curso.
WORKDIR /workspaces
#---------------------------------------------------------------------------
#Part I WORKDIR /workspaces
#This instruction sets the default folder for the next Dockerfile commands and for the terminal when the container starts.
#I use /workspaces because GitHub Codespaces normally places repository folders inside this path. This makes the environment easier to use because the terminal starts close to the course files instead of starting from a system folder like /.

#WORKDIR also helps keep later commands organized. If a RUN, CMD, or shell session
#needs a working directory, Docker will use this location unless another folder is
#selected later.

#This connects with Black Hat Bash Ch.1 because working with the shell often depends on knowing the current directory before running commands such as ls, cd, git, or scripts.
#---------------------------------------------------------------------------


#

# Configuración de Git para el contenedor:
# - safe.directory *: confía en cualquier repo montado (necesario porque
#   /workspaces/... tiene un UID distinto al de root dentro del container).
# - init.defaultBranch main: evita warnings de "master vs main" en git init.
# - pull.rebase false: merge por defecto al hacer pull (más intuitivo)
# - git lfs install --system: registra los hooks de LFS globalmente para
#   que, si un repo los necesita, funcionen sin sorpresas.
RUN git config --system --add safe.directory '*' \
 && git config --system init.defaultBranch main \
 && git config --system pull.rebase false \
 && git lfs install --system

# ----------------------------------------------------------------------------
# CMD: comando que se ejecuta por defecto al arrancar el contenedor
# ----------------------------------------------------------------------------
# Lanza una shell bash interactiva. Codespaces la sobrescribe con su
# propia terminal integrada de VS Code, pero es buena práctica dejarla
# definida para que la imagen sea usable también con Docker puro.
# Prompt del curso para bash
RUN chsh -s /usr/bin/zsh root

RUN cat >> /root/.zshrc <<'EOF'

PROMPT='%F{cyan}[Ashley_Espinoza⋆]%f %F{yellow}%1~%f %(?.%F{green}√.%F{red}X %?)%f %# '
EOF

CMD ["/usr/bin/zsh"]

