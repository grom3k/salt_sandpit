#!/usr/bin/env python
import socket

def get_role():
    hostname = socket.gethostname()
    role = hostname.split('-')[1]

    return {'role': role}
