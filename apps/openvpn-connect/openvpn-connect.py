import appscript
from talon import Context, Module, actions, app, ctrl, storage, clip

ctx = Context()
mod = Module()

@mod.action_class
class Actions:
    def openvpn_icon_menu():
        """Activates openvpn connect icon in mac top menu bar (systray)"""
        x, y = appscript.app('System Events').processes['OpenVPN Connect'].menu_bars[2].position()
        ctrl.mouse_move(x, y)
        ctrl.mouse_click()

    def openvpn_connect():
        """Activate menu option Connect..."""
        actions.sleep("100ms")
        actions.key("c")
        actions.sleep("500ms")
        actions.key("enter")

    def openvpn_disconnect():
        """Activate menu option Disconnect"""
        actions.sleep("100ms")
        actions.key("d")
        actions.sleep("500ms")
        actions.key("enter")

    def openvpn_use_last_saved_host():
        """Connect using last saved host when the 'hostname' dialog appears"""
        actions.sleep("200ms")
        actions.key("enter")
        actions.sleep("200ms")

    def openvpn_enter_password(password: str):
        """Enter the password in the password dialog"""
        actions.sleep("500ms")
        actions.insert(password)
        actions.sleep("200ms")
        actions.key("enter")

    def connect_to_vpn(password: str):
        """Connect to the last saved host in OpenVPN Connect app"""
        actions.user.openvpn_icon_menu()
        actions.user.openvpn_connect()
        actions.user.openvpn_use_last_saved_host()
        actions.user.openvpn_enter_password(password)
        print("finish connect_to_vpn...")

    def disconnect_from_vpn():
        """Disconnect from the host in OpenVPN Connect app"""
        actions.user.openvpn_icon_menu()
        actions.user.openvpn_disconnect()