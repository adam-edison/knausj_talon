from talon import Module, Context, actions, clip
import requests
mod = Module()
ctx = Context()

ctx.matches = """
os: mac
"""

def send_request(text: str, data: dict = None):
  url = "http://localhost:5052/command/execute"
  
  payload = {"command": text }

  if data:
    payload["data"] = data

  response = requests.post(url, json=payload)
  print(f"Response Body: {response.text}")

@mod.action_class
class Actions:
  def local_productivity_get_statistics() -> None:
    """Get statistics"""
    send_request("get statistics")

  def local_productivity_update_recurrences() -> None:
    """Update recurrences"""
    send_request("update recurring tasks")
