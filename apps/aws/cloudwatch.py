
filter = f"""
fields @timestamp, @message
| filter @message like /bcfeb650-63ed-567d-aec7-ecd0e359b374/
| sort @timestamp desc
| limit 20
"""
