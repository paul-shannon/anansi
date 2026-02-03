import pandas as pd
import matplotlib.pyplot as plt

tbl = pd.read_csv("completions.csv")
print(tbl)

plt.plot(tbl['year'], tbl['primary'], linestyle='-', marker='o')
plt.plot(tbl['year'], tbl['secondary'], linestyle='-', marker='o')
plt.title("Primary (blue) and Secondary (Orange)\nGhana School Completion Rates\nUNESCO")
plt.show()
