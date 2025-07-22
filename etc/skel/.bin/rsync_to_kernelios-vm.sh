#!/bin/bash
rsync -a /home/ilan/DATA/SynologyDrive/KERNELIOS/PDF/  ilan@10.0.0.102:/home/ilan/kernelios-lpi/
rsync -a /home/ilan/.local/share/backgrounds/  ilan@10.0.0.102:/home/ilan/kernelios-lpi/.Backgrounds/
rsync -a /home/ilan/DATA/SynologyDrive/KERNELIOS/TEMPLATE/  ilan@10.0.0.102:/home/ilan/kernelios-lpi/.Template/

