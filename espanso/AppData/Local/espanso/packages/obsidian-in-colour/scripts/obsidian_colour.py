import os

colour = os.environ['ESPANSO_STYLEFORM_COLOUR']
size = os.environ['ESPANSO_STYLEFORM_SIZE']

colour_dict = {
  "red": "#e75153",
  "orange": "#F77F45",
  "green": "#98c379",
  "aqua": "#56b6c2",
  "purple": "#9a52c4",
  "blue": "#2F8DEF",
  "yellow":" #e5c07b",
}
size_dict = {
    "h1": "32px",
    "h2": "24px",
    "h3": "18.72px",
    "h4": "16px",
    "h5": "13.28px",
    "h6": "10.72px",
    "p": "16px",
}

if colour in colour_dict:
    colour = colour_dict[colour]

if size in size_dict:
    size = size_dict[size]

print(f'<p style="color:{colour};font-size:{size}">$|$</p>')