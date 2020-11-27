#!/bin/bash
sudo apt install python3-gi python3-gi-cairo gir1.2-gtk-3.0
pip install -r requirements
sudo make install
sudo python main.py

