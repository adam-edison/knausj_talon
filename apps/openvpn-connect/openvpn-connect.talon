os: mac
-

connect to vpn:
    password = user.get_password("universal vpn")
    user.connect_to_vpn(password)

disconnect from vpn:
    user.disconnect_from_vpn()